## Instructions

This folder contains scripts to run fault injections across 10 compiled applications with LLFI. The default number of fault injections are 1000. You can change that in the `input.yaml` file.

To run fault injection for each application, you have specify two things: application name and application input. 

For example, to run fault injections with an input `"1000 10"` in `pathfinder` application, users would run `python runFi.py pathfinder "1000 10"`