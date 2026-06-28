# Tutorial Datasets

Clean example datasets used in the Ideogram 4 LoRA training tutorial.

Each dataset contains image files and matching `.txt` captions. The captions are raw UTF-8 JSON strings for Ideogram 4. They are not Markdown files and should not contain code fences.

## Datasets

- `mp_scifi_buggy`  
  13 image/caption pairs for a rugged sci-fi military buggy.

- `mp_power_armor`  
  7 image/caption pairs for a futuristic powered-armor supersoldier.

## Usage

In the AI Toolkit config, set the dataset folder to the matching `images` folder:

```yaml
datasets:
  - folder_path: "C:/ideogram4_lora_training/mp_scifi_buggy/images"
    caption_ext: "txt"
```

If you use these files directly from this repository, copy the dataset to your local training folder first, or update `folder_path` to point to the cloned repository location.

