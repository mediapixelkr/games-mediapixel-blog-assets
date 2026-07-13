# Krea 2 Turbo in ComfyUI: Low-VRAM Inference Guide Assets

This directory contains public ComfyUI workflows and prompt files for the article "Krea 2 Turbo in ComfyUI: Low-VRAM Inference Guide".

## Directory Structure

* **[workflows/](workflows/)**: ComfyUI workflow API JSON files that can be imported or queued directly.
  * [krea2_turbo_workflow_std_api.json](workflows/krea2_turbo_workflow_std_api.json): The Standard Krea 2 Turbo workflow API payload.
  * [krea2_turbo_workflow_reason_api.json](workflows/krea2_turbo_workflow_reason_api.json): The Reasoning workflow API payload featuring the `KreaReason` prompt-expansion node.
* **[prompts/](prompts/)**: Structured prompt JSON files utilized during testing.
  * [01-cargo-crate.json](prompts/01-cargo-crate.json): Sci-Fi Cargo Crate prompt.
  * [02-blacksmith-carriage.json](prompts/02-blacksmith-carriage.json): RPG Blacksmith Carriage prompt.
  * [03-fps-environment.json](prompts/03-fps-environment.json): Cinematic FPS Environment prompt.
  * [04-powered-armor.json](prompts/04-powered-armor.json): Powered Armor Suit prompt.

---

## 🛠️ Required Model Files
To run these workflows, place the following official models in your ComfyUI models path:
1. **UNET Model**: `krea2_turbo_fp8_scaled.safetensors` -> `ComfyUI/models/unet/` (or `diffusion_models/`)
2. **Text Encoder**: `qwen3vl_4b_fp8_scaled.safetensors` -> `ComfyUI/models/clip/` (or `text_encoders/`)
3. **VAE Model**: `qwen_image_vae.safetensors` -> `ComfyUI/models/vae/`
