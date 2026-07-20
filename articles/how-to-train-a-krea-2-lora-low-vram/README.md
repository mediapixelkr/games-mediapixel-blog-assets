# How to Train a Krea 2 LoRA (Low VRAM)

Companion files for the Media-Pixel article about training a Krea 2 LoRA on a 12GB GPU with Musubi Tuner.

## Files

- `config/mp_concept_krea2_dataset_512.toml`  
  Sample TOML dataset configuration for Musubi Tuner.

- `scripts/run_krea2_train.ps1`  
  PowerShell launcher script configured with optimized block-swapping and memory offloading settings.

- `scripts/prepare_krea2_dataset.py`  
  Optional Python script to clean automatic metadata tags and prepare clean JSON captions for Krea 2 training.

- `workflows/Krea2_turbo_00001_.png`  
  ComfyUI inference workflow for testing the trained Krea 2 LoRA on Krea 2 Turbo (drag and drop the PNG into ComfyUI to load the workflow).

## Expected Local Paths

The sample config assumes this Windows layout:

```text
C:\musubi-tuner
C:\krea2_models\DiffusionModels\raw.safetensors
C:\krea2_models\text_encoders\qwen3vl_4b_bf16.safetensors
C:\krea2_models\VAE\qwen_image_vae.safetensors
C:\krea2_lora_training\mp_concept_krea2\krea2_images
C:\krea2_lora_training\mp_concept_krea2\output_krea2
```

If your folders are different, update:

- The path variables in `scripts/run_krea2_train.ps1`
- The `image_directory` and `cache_directory` in `config/mp_concept_krea2_dataset_512.toml`

## Memory Optimization Notes

To train Krea 2 on a 12GB GPU (RTX 3060) without CUDA OOM crashes, the following settings are enabled in the training launcher script:

- `--fp8_base` and `--fp8_scaled`: Quantizes base model to FP8.
- `--blocks_to_swap 20`: Swaps inactive transformer blocks from GPU to CPU system RAM.
- `--block_swap_h2d_only`: Asymmetric transfer to eliminate GPU-to-CPU return overhead.
- `--block_swap_ring_size 2`: Double-buffering to overlap block copying and computation.

> **System RAM note:** Since this workflow relies heavily on CPU offloading, it is recommended to have at least 32 GB (preferably 64 GB) of system RAM to handle Windows, caches, and memory swapping cleanly.

## Timestep Sampling

The launcher uses:

```text
--timestep_sampling krea2_shift
```

`krea2_shift` applies Krea 2's resolution-aware timestep shift to each bucket. This is preferable when aspect-ratio bucketing produces different training dimensions.

Do not combine `krea2_shift` with `--discrete_flow_shift 2.5`. The fixed value `2.5` corresponds approximately to Krea 2's 1024 x 1024 inference shift and is not resolution-aware.

This scheduler change is about matching Krea 2's resolution-dependent behavior. It should not be presented as the cause of a large training-speed improvement. The main low-VRAM performance settings remain explicit FP8 conversion and the three block-swapping options listed above.

## Benchmark Interpretation

Compare step timings only when the model, software environment, latent area, aspect ratio, and swapping arguments are identical. In particular:

- An early 512 px Raw + FP8 test that reached roughly 85-113 seconds per step did not actually include `--blocks_to_swap 20`, `--block_swap_h2d_only`, or `--block_swap_ring_size 2` in the executed command.
- A later horizontal sprite-strip run used the optimized launcher at a nominal `1024 x 256` training area and completed at roughly 7.8 seconds per step on an RTX 3060 12 GB.
- `1024 x 256` and `512 x 512` contain the same number of pixels, but their aspect ratios and kernel workloads differ. The sprite-strip result should not be claimed as a universal 512 px benchmark without a controlled square-image rerun.

## Resume Behavior

Musubi restores the model, optimizer, scheduler, sampler, and random state from a saved state directory, but the displayed step counter can restart at zero for a continuation run. Treat `--max_train_steps` as the number of steps in that continuation unless the behavior has been verified for the installed Musubi version.

For example, to continue a completed 250-step run to 500 cumulative steps, resume from the original step-250 state and run 250 additional steps in a separate output directory. Keeping continuation outputs separate prevents local step names such as `step00000050` from overwriting the original 50-step checkpoint.
