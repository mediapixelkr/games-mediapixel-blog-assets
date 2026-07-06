from __future__ import annotations

import argparse
import json
import shutil
from pathlib import Path

# General helper script to prepare a Krea 2 dataset with structured JSON captions.
# It copies PNG images and cleans up caption text files, ensuring they are valid UTF-8 JSON
# and contain the target trigger word.

def load_json(path: Path) -> dict:
    return json.loads(path.read_text(encoding="utf-8-sig"))

def main() -> None:
    parser = argparse.ArgumentParser(description="Prepare dataset for Krea 2 training.")
    parser.add_argument("--source", type=str, required=True, help="Directory containing original images and txt files")
    parser.add_argument("--target", type=str, required=True, help="Directory where prepared files will be saved")
    parser.add_argument("--trigger", type=str, required=True, help="Trigger token to insert in high_level_description if missing")
    
    args = parser.parse_args()
    
    source_dir = Path(args.source).resolve()
    target_dir = Path(args.target).resolve()
    trigger = args.trigger
    
    target_dir.mkdir(parents=True, exist_ok=True)

    pairs = []
    for image_path in sorted(source_dir.glob("*.png")):
        caption_path = image_path.with_suffix(".txt")
        if not caption_path.exists():
            raise FileNotFoundError(f"Missing caption for {image_path.name}")
        pairs.append((image_path, caption_path))

    if not pairs:
        raise RuntimeError(f"No PNG/TXT pairs found in {source_dir}")

    for image_path, caption_path in pairs:
        data = load_json(caption_path)
        
        # Clean dataset tags if present (commonly added in other pipelines)
        data.pop("dataset_tags", None)

        high = data.get("high_level_description", "")
        if trigger not in high:
            # Prepend trigger word if not already present
            high = f"{trigger}, {high}".strip(", ")
            
        data["high_level_description"] = high

        out_image = target_dir / image_path.name
        out_caption = target_dir / caption_path.name
        
        # Copy image file
        shutil.copy2(image_path, out_image)
        
        # Write clean raw JSON caption without BOM
        out_caption.write_text(
            json.dumps(data, ensure_ascii=False, indent=2),
            encoding="utf-8",
            newline="\n",
        )

    print(f"Prepared {len(pairs)} Krea 2 training pairs in {target_dir}")

if __name__ == "__main__":
    main()
