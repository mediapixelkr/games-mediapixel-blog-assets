# How to Train an Ideogram 4 LoRA

Companion files for the Media-Pixel article about training a small Ideogram 4 LoRA with AI Toolkit.

## Files

- `ai-toolkit/config/mp_scifi_buggy_aitk_500steps.yaml`  
  Low-VRAM AI Toolkit config for the `mp_scifi_buggy` example.

- `scripts/run_mp_scifi_buggy_aitk_500steps.ps1`  
  PowerShell launcher that runs AI Toolkit and writes a timestamped log.

- `workflows/ideogram4_lora_test_workflow.json`  
  ComfyUI workflow for testing the LoRA with Ideogram 4.

## Expected Local Paths

The sample config assumes this Windows layout:

```text
C:\ai-toolkit
C:\ai-toolkit\models\ideogram-4-fp8
C:\ideogram4_lora_training\mp_scifi_buggy\images
C:\ideogram4_lora_training\mp_scifi_buggy\output_aitk
```

If your folders are different, update:

- `training_folder`
- `datasets.folder_path`
- `model.name_or_path`
- `model.model_kwargs.text_encoder_path`

