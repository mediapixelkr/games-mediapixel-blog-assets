# mp_power_armor Dataset

Small clean dataset for the `mp_power_armor` Ideogram 4 LoRA example.

## Contents

- 7 image/caption pairs
- Trigger token: `mp_power_armor`
- Caption format: raw UTF-8 `.txt` files containing Ideogram-style JSON

## Training Notes

This dataset is useful for testing rank choice and LoRA stacking.

Recommended variants:

```text
rank 16 / alpha 16 -> stronger solo or main-concept LoRA
rank 8 / alpha 8   -> lighter stackable LoRA
```

Suggested checkpoints:

```text
400 steps -> early comparison point
500 steps -> about 71 steps/image
600 steps -> about 86 steps/image
700 steps -> about 100 steps/image
800 steps -> about 114 steps/image
```

For stack tests with `mp_scifi_buggy`, start with lower LoRA strengths and raise gradually.

