# Mage-Flow Turbo vs Krea 2 Turbo: Benchmark Assets

This directory contains the public prompts, ComfyUI workflows and objective source data for the MediaPixel article "Mage-Flow vs Krea 2 Turbo on 12GB VRAM".

## Prompt IDs

Labels such as `P01`, `P02` and `P09` in the article figures and filenames are stable prompt identifiers, not scores.

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

The exact unexpanded prompt text is in [prompts/pop-culture.json](prompts/pop-culture.json) and [prompts/photography.json](prompts/photography.json).

## Directory structure

- [prompts/](prompts/): frozen P01–P12 prompt text and high-resolution mappings.
- [workflows/](workflows/): validated ComfyUI UI graphs.

## Main workflows

Workflow provenance: [games.mediapixel.kr](https://games.mediapixel.kr/). Both graphs include this provenance note on the canvas and use labeled regions to separate model loading, conditioning, sampling, and final VAE decoding/output.

- [mageflow-turbo-int8-ui.json](workflows/mageflow-turbo-int8-ui.json): Mage-Flow Turbo INT8 ConvRot, 4 steps, CFG 1.0, Euler/simple, native Mage-Flow shift 6.0.
- [krea2-turbo-fp8-ui.json](workflows/krea2-turbo-fp8-ui.json): Krea 2 Turbo FP8 scaled, 8 steps, Euler, beta57 scheduler, alpha 0.5, beta 0.7.

## Required model files

| Pipeline component | SHA-256 |
|---|---|
| `mage_flow_turbo_int8_convrot.safetensors` | `327c3967a5190ea52e453ec3dd81ba168e37a2a0ff2c763aa3e9260bbbe1913c` |
| `mage_flow_turbo_bf16.safetensors` | `6df47df3d7efc9ebdad075b87b3e9e4f74d09dca672d592271788f0ee27ab97d` |
| `mage_flow_bf16.safetensors` | `04431abbc3acd1a5b86a7f77269f8e77e05a6cac3b21f35e1aef7493f6ab4934` |
| `qwen3vl_4b_bf16.safetensors` | `36f3ff447ef59201722e8f9ce6020c9819fdcfba6aa2608c4e09b1c0ce114e34` |
| `mage_flow_vae_bf16.safetensors` | `34e076dc1e8a15321e1e07be5111d59cf16dd10b804b7c7e20b4de29013427e0` |
| `krea2_turbo_fp8_scaled.safetensors` | `eb4dd8c612cfd10f64f25b057e6e6bbcb5737c94a7372177e456dbf7579502f1` |
| `qwen3vl_4b_fp8_scaled.safetensors` | `54bd5144df0bbc25dd6ccadfcb826b521445a1b06ae5a42570bdd2974ca87094` |
| `qwen_image_vae.safetensors` | `a70580f0213e67967ee9c95f05bb400e8fb08307e017a924bf3441223e023d1f` |

No LoRA or adapter was used in either main benchmark pipeline.