$ErrorActionPreference = "Stop"
$env:PYTHONIOENCODING = "utf-8"

$MusubiRoot = "C:\musubi-tuner"
$DatasetConfig = "C:\krea2_lora_training\mp_concept_krea2\mp_concept_krea2_dataset_512.toml"
$OutputDir = "C:\krea2_lora_training\mp_concept_krea2\output_krea2"
$OutputName = "mp_concept_krea2_lora_512"

$RawDit = "C:\krea2_models\DiffusionModels\raw.safetensors"
$Vae = "C:\krea2_models\VAE\qwen_image_vae.safetensors"
$TextEncoder = "C:\krea2_models\text_encoders\qwen3vl_4b_bf16.safetensors"

New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null

Push-Location $MusubiRoot
try {
    # 1. Cache VAE image latents (very fast)
    Write-Host "Caching image latents..." -ForegroundColor Cyan
    .\.venv\Scripts\python.exe src\musubi_tuner\krea2_cache_latents.py `
        --dataset_config $DatasetConfig `
        --vae $Vae

    # 2. Cache Text Encoder outputs (executed once at startup)
    Write-Host "Caching text encoder embeddings..." -ForegroundColor Cyan
    .\.venv\Scripts\python.exe src\musubi_tuner\krea2_cache_text_encoder_outputs.py `
        --dataset_config $DatasetConfig `
        --text_encoder $TextEncoder `
        --batch_size 1

    # 3. Launch LoRA training with memory swapping and GPU acceleration
    Write-Host "Launching network training..." -ForegroundColor Green
    .\.venv\Scripts\accelerate.exe launch --num_cpu_threads_per_process 1 --mixed_precision bf16 `
        src\musubi_tuner\krea2_train_network.py `
        --dit $RawDit `
        --fp8_base `
        --fp8_scaled `
        --vae $Vae `
        --dataset_config $DatasetConfig `
        --sdpa `
        --mixed_precision bf16 `
        --timestep_sampling krea2_shift `
        --weighting_scheme none `
        --optimizer_type adamw8bit `
        --learning_rate 1e-4 `
        --gradient_checkpointing `
        --blocks_to_swap 20 `
        --block_swap_h2d_only `
        --block_swap_ring_size 2 `
        --max_data_loader_n_workers 2 `
        --persistent_data_loader_workers `
        --network_module networks.lora_krea2 `
        --network_dim 16 `
        --network_alpha 16 `
        --max_train_steps 500 `
        --save_every_n_steps 50 `
        --save_state `
        --save_precision bf16 `
        --seed 42 `
        --output_dir $OutputDir `
        --output_name $OutputName
}
finally {
    Pop-Location
}
