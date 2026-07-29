# Mage-Flow Turbo vs FLUX.2 klein 4B: ComfyUI Assets

This directory contains the public prompts and ComfyUI workflows used for the
MediaPixel article
[Mage-Flow Turbo vs FLUX.2 klein 4B on an RTX 3060 12GB](https://games.mediapixel.kr/blog/mage-flow-vs-flux2-klein-4b-12gb).

The comparison is size-matched at the diffusion-model level. It does not imply
that the complete pipelines have identical architectures, parameter counts or
memory footprints. Both pipelines also use separate 4B text encoders and
model-specific VAEs.

## Included files

- [prompts/pop-culture.json](prompts/pop-culture.json): frozen P01-P06 prompts
  and high-resolution mappings.
- [prompts/photography.json](prompts/photography.json): frozen P07-P12 prompts
  and high-resolution mappings.
- [workflows/mageflow-turbo-int8-ui.json](workflows/mageflow-turbo-int8-ui.json):
  expanded Mage-Flow Turbo INT8 text-to-image workflow.
- [workflows/flux2-klein-4b-fp8-ui.json](workflows/flux2-klein-4b-fp8-ui.json):
  FLUX.2 klein distilled 4B FP8 workflow derived from the official ComfyUI
  template.

Only UI workflows are included. API-only benchmark graphs are intentionally
excluded.

## Default comparison

Both workflows open with the same reproducible example:

- prompt: P09, young woman on a commuter train;
- seed: `4451`;
- resolution: `1024x1024`;
- batch size: `1`.

The workflow canvases contain a `games.mediapixel.kr` provenance note and
labeled regions for components, conditioning, sampling and full VAE output.

## Mage-Flow Turbo INT8

| Setting | Value |
|---|---|
| Diffusion model | `mage_flow_turbo_int8_convrot.safetensors` |
| Text encoder | `qwen3vl_4b_bf16.safetensors` |
| CLIP type | `mage` |
| VAE | `mage_flow_vae_bf16.safetensors` |
| Steps | `4` |
| CFG | `1.0` |
| Sampler | Euler |
| Scheduler | simple |
| Flow shift | native Mage-Flow shift `6.0` |

The flow shift is supplied automatically by ComfyUI's native Mage-Flow model
detection. No separate model-sampling node is required.

## FLUX.2 klein 4B FP8

| Setting | Value |
|---|---|
| Diffusion model | `flux-2-klein-4b-fp8.safetensors` |
| Text encoder | `qwen_3_4b.safetensors` |
| CLIP type | `flux2` |
| VAE | `flux2-vae.safetensors` |
| Steps | `4` |
| CFG | `1.0` |
| Sampler | Euler |
| Scheduler | native `Flux2Scheduler` |
| Internal model shift | `2.02` |

The FLUX workflow retains the official distilled core chain:
`ConditioningZeroOut`, `CFGGuider`, `KSamplerSelect`, `Flux2Scheduler`,
`SamplerCustomAdvanced` and a full `VAEDecode`.

The outer FLUX subgraph exposes width and height once and applies them to both
the latent initialization and the resolution-aware scheduler.

## Model directories

Place the required files in the corresponding ComfyUI model directories, or
make them visible through `extra_model_paths.yaml`:

```text
ComfyUI/
└── models/
    ├── diffusion_models/
    │   ├── mage_flow_turbo_int8_convrot.safetensors
    │   └── flux-2-klein-4b-fp8.safetensors
    ├── text_encoders/
    │   ├── qwen3vl_4b_bf16.safetensors
    │   └── qwen_3_4b.safetensors
    └── vae/
        ├── mage_flow_vae_bf16.safetensors
        └── flux2-vae.safetensors
```

No LoRA, adapter, prompt expansion, upscaler or post-processing node is used.
Model files are not distributed in this repository.

## Prompt IDs

Labels such as `P01`, `P02` and `P09` are stable prompt identifiers, not
scores.

| ID | Subject |
|---|---|
| P01 | Samus Aran in an iconic biomechanical Metroid environment |
| P02 | Lara Croft in a jungle temple chamber |
| P03 | Master Chief on a Halo ring battlefield |
| P04 | Kratos in a Norse God of War environment |
| P05 | The Terminator in the motorcycle-versus-truck chase |
| P06 | Solid Snake in a Shadow Moses-style infiltration scene |
| P07 | Woman in a rainy neighborhood cafe |
| P08 | Man choosing vegetables in a supermarket |
| P09 | Young woman on a commuter train |
| P10 | Man folding clothes in a laundromat |
| P11 | Florist arranging a bouquet |
| P12 | Architect in a design studio |

The prompt text is stored exactly as used. Automatic prompt enhancement was
disabled.

## Workflow provenance

The FLUX graph is derived from the
[official ComfyUI FLUX.2 klein text-to-image template](https://docs.comfy.org/tutorials/flux/flux-2-klein).
MediaPixel selected the benchmark components and settings, removed the unused
Base branch, added the reproducible P09 example, and organized the canvas for
public use.

Public companion workflow preparation:
[games.mediapixel.kr](https://games.mediapixel.kr/).
