## Folder Contents

This folder contains scripts to run per-instruction fault injections across 10 compiled applications with LLFI. The default number of fault injections per instruction is 100. You can change that in `input.yaml` file.

To run per-instruction fault injection For each application, you have specify two things: application name and application input. 

For example, to run per-inst fault injections with an input `"1000 10"` in `pathfinder` application, users would run `python runFiForInst.py pathfinder "1000 10"`