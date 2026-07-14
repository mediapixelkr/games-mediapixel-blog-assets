# Krea 2 Raw vs. Turbo in ComfyUI: Benchmark Assets

This directory contains public ComfyUI workflows and reference image assets for the article "Krea 2 Raw vs. Turbo in ComfyUI: Is Raw Worth the Wait?".

---

## 📂 Directory Structure

*   **[workflows/](workflows/)**: ComfyUI workflow JSON files that can be imported directly.
    *   [krea2_turbo_standard_ui.json](workflows/krea2_turbo_standard_ui.json): Standard Krea 2 Turbo (8 steps) Web UI workflow with wire connections.
    *   [krea2_turbo_standard_api.json](workflows/krea2_turbo_standard_api.json): Krea 2 Turbo API payload.
    *   [krea2_raw_standard_ui.json](workflows/krea2_raw_standard_ui.json): Standard Krea 2 Raw (52 steps) Web UI workflow with wire connections.
    *   [krea2_raw_official_like_ui.json](workflows/krea2_raw_official_like_ui.json) / [krea2_raw_official_like_api.json](workflows/krea2_raw_official_like_api.json): The validated "official-like" Raw workflow utilizing two conditional/unconditional model evaluations.
    *   [krea2_raw_turbolora_standard_api.json](workflows/krea2_raw_turbolora_standard_api.json): Hybrid Raw + Turbo LoRA API payload.
*   **[images/](images/)**: High-resolution standalone generations used in the quality benchmarks.
    *   `lara_turbo_8_52001.png` / `chief_turbo_8_52002.png`: Generations from Krea 2 Turbo.
    *   `lara_raw_52_52001.png` / `chief_raw_52_52002.png`: Generations from Krea 2 Raw.
    *   `lara_raw_turbolora_12_52001.png` / `chief_raw_turbolora_12_52002.png`: Generations from the Raw + Turbo LoRA hybrid workflow.
    *   **[crops/](images/crops/)**: Close-up detail crops for face/hair and visor/armor material inspection.

---

## 🛠️ Required Model Files

To run these workflows, place the following official model assets in your ComfyUI path:

1.  **Turbo UNET Model**: `krea2_turbo_fp8_scaled.safetensors` -> `ComfyUI/models/unet/` (or `diffusion_models/`)
2.  **Raw UNET Model**: `krea2_raw_fp8_scaled.safetensors` -> `ComfyUI/models/unet/` (or `diffusion_models/`)
3.  **Text Encoder**: `qwen3vl_4b_fp8_scaled.safetensors` -> `ComfyUI/models/clip/` (or `text_encoders/`)
4.  **VAE Model**: `qwen_image_vae.safetensors` -> `ComfyUI/models/vae/`
5.  **Turbo LoRA**: `krea2_turbo_lora_rank_64_bf16.safetensors` -> `ComfyUI/models/loras/`
