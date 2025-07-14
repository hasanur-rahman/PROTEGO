## Instructions

This folder contains scripts to form representative input groups and generate representative SID protected binaries for 10 applications.

Inside a particular application folder, the steps are as follows:
1. Run script `python copy_sid_protected_instlist.py representative_input_list.txt <Protected Inst List Filepath from Utilities Folder> Input` to copy protected inst list log files for inputs listed in `representative_input_list.txt` file.
2. Run script `python generate_protected_binaries.py <application name>` to generate representative SID protected binaries for that application