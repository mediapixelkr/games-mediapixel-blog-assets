# How to Train an Ideogram 4 LoRA

Companion files for the Media-Pixel article about training a small Ideogram 4 LoRA with AI Toolkit.

## Files

- `ai-toolkit/config/mp_scifi_buggy_aitk_500steps.yaml`  
  Low-VRAM AI Toolkit config for the `mp_scifi_buggy` example.

- `ai-toolkit/config/mp_power_armor_rank16_aitk_800steps.yaml`  
  Stronger rank 16 config for a powered-armor LoRA used by itself or as a main concept.

- `ai-toolkit/config/mp_power_armor_rank8_aitk_800steps.yaml`  
  Lighter rank 8 config for a powered-armor LoRA designed to stack more cleanly with another LoRA.

- `scripts/run_mp_scifi_buggy_aitk_500steps.ps1`  
  PowerShell launcher that runs AI Toolkit and writes a timestamped log.

- `workflows/ideogram4_lora_test_workflow.json`  
  ComfyUI workflow for testing the LoRA with Ideogram 4.

- `datasets/mp_scifi_buggy/images`  
  Clean 13-image dataset with matching JSON `.txt` captions.

- `datasets/mp_power_armor/images`  
  Clean 7-image dataset with matching JSON `.txt` captions.

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

## Rank Notes

For a LoRA used mostly by itself, `rank 16 / alpha 16` is a good first choice.

For a LoRA that will often be stacked with another LoRA, a lighter `rank 8 / alpha 8` version may blend better. This is especially useful when both LoRAs share similar visual language such as military sci-fi, armor, hard-surface panels, green metal, weapons, and battlefield lighting.

Suggested starting strengths:

```text
main concept rank 16      @ 0.65-0.80
secondary concept rank 8  @ 0.55-0.80
```

If both LoRAs are rank 16, start lower:

```text
first rank 16 LoRA  @ 0.45-0.65
second rank 16 LoRA @ 0.35-0.60
```
