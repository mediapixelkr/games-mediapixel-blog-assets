# Qwen Image 2.1 vs Image Models on RTX 3060 12GB: Benchmark Assets

This directory archives the five final ComfyUI API workflows used for the MediaPixel article:

**https://games.mediapixel.kr/blog/qwen-image-2-1-vs-image-models-rtx-3060-12gb**

## Directory structure

- [workflows/](workflows/): one frozen API/execution workflow per model, usable as-is to reproduce the benchmark via ComfyUI's `/prompt` endpoint.
- [reports/](reports/): validation notes and historical benchmark documentation.

## Final benchmark workflows

- [ernie_image_turbo_benchmark_api.json](workflows/ernie_image_turbo_benchmark_api.json): ERNIE-Image-Turbo, Q4_K_M, 1024x1024, 8 steps, Euler/simple, CFG 1.0.
- [krea2_turbo_benchmark_api.json](workflows/krea2_turbo_benchmark_api.json): Krea 2 Turbo, Krea2_Turbo_int8mixed, 1024x1024, 8 steps, Euler/simple, CFG 1.0.
- [hidream_o1_benchmark_api.json](workflows/hidream_o1_benchmark_api.json): HiDream-O1-Image, validated native 2048x2048 workflow, DPM++ 2M SDE GPU/normal, 40 steps, CFG 5.0.
- [z_image_turbo_benchmark_api.json](workflows/z_image_turbo_benchmark_api.json): Z-Image-Turbo, INT8 ConvRot, 1024x1024, 9 steps, Euler/simple, CFG 1.0.
- [qwen2_1_benchmark_api.json](workflows/qwen2_1_benchmark_api.json): Qwen-Image-2.1, W4A8 text encoder, 1024x1024, 40 steps, Euler/simple, CFG 1.0.

## Excluded workflows

Ideogram 4 and Stable Diffusion 3.5 Large Turbo were tested during development but are not part of the final benchmark workflow set. Optional Qwen 2048 and Pruna speed workflows are documented in the article reports but are not archived as final benchmark workflows here.
