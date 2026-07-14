# Krea 2 Turbo Resolution Test: 1MP vs 4MP on 12GB VRAM

This directory contains public ComfyUI workflows and prompt files for the article "Krea 2 Turbo Resolution Test: 1MP vs 4MP on 12GB VRAM".

## Directory Structure

* **[images/](prompts/)**: All the images used during the tests, with embbeded workflows.


---

## 🛠️ Required Model Files
To run these workflows, place the following official models in your ComfyUI models path:
1. **UNET Model**: `krea2_turbo_fp8_scaled.safetensors` -> `ComfyUI/models/unet/` (or `diffusion_models/`)
2. **Text Encoder**: `qwen3vl_4b_fp8_scaled.safetensors` -> `ComfyUI/models/clip/` (or `text_encoders/`)
3. **VAE Model**: `qwen_image_vae.safetensors` -> `ComfyUI/models/vae/`
