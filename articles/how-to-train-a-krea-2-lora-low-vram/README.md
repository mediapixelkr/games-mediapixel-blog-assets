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
