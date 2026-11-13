# MiniMax H3-Image vs Krea 2 Turbo: ComfyUI Workflows and Prompts

This directory contains runnable ComfyUI canvas workflows and the prompts used for the MediaPixel Games comparison.

## Directory Structure

- **[workflows/](workflows/)**: ComfyUI workflow JSON files that can be opened and queued directly.
  - [minimax-h3-woovee-w4a8-ui.json](workflows/minimax-h3-woovee-w4a8-ui.json): MiniMax H3-Image Woovee W4A8 workflow, 6 steps, CFG 1.0, Euler ancestral/simple, 2912x2912 default example.
  - [krea2-turbo-int8mixed-ui.json](workflows/krea2-turbo-int8mixed-ui.json): Krea 2 Turbo INT8-mixed workflow, 8 steps, CFG 1.0, Euler/simple, 1024x1024 default example.
- **[prompts/](prompts/)**: Prompt text for the scenes and characters shown in the article.
  - [photography-scenes.json](prompts/photography-scenes.json): Fisherman portrait, supermarket, Tokyo cafe and product photography.
  - [pop-culture-characters.json](prompts/pop-culture-characters.json): Samus Aran, Lara Croft, Kratos and The Terminator.

Both workflow canvases contain the article provenance URL in a visible note. The prompt node is editable; copy another prompt from the prompt files to try a different article scene. Required model filenames are listed in each workflow note. The prompts are taken from the original H3 ComfyUI metadata; the flattened published comparison images do not preserve separate Krea prompt metadata.
