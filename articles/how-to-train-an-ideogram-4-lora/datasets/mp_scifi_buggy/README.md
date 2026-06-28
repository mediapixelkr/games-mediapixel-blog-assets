# mp_scifi_buggy Dataset

Small clean dataset for the `mp_scifi_buggy` Ideogram 4 LoRA example.

## Contents

- 13 image/caption pairs
- Trigger token: `mp_scifi_buggy`
- Caption format: raw UTF-8 `.txt` files containing Ideogram-style JSON

## Training Notes

This dataset was used for the tutorial's main example LoRA.

Useful checkpoints observed during testing:

```text
500 steps  -> first meaningful test
1000 steps -> strong result
1250 steps -> close to final
1500 steps -> stronger, more specific result
```

For the tutorial config, start with:

```yaml
trigger_word: "mp_scifi_buggy"
resolution: [768]
steps: 500
linear: 16
linear_alpha: 16
```

