import os, sys


appName = sys.argv[1]
inputList = open('representative_input_list.txt', 'r').readlines()

selected_protection_level = [10, 30, 50, 70]

for eachInput in inputList:
    if eachInput != "\n":
        curInput = eachInput.replace("\n", "")
        
        print("\nProcessing current input: {}".format(curInput))
        
        filepath = "Input/protected-inst-list-" + curInput.replace(" ", "-") + ".txt"
        if not os.path.isfile(filepath):
            print("First, with scripts from Utilities/Obtain-protected-inst-list folder, obtain instruction list that will be duplicated!")
            
            sys.exit(0)
            
        protected_binary_path = "protected-binary-for-{}".format(curInput.replace(" ", "-"))
        os.system("mkdir {}".format(protected_binary_path))
        
        
        with open(filepath, 'r') as infile:
            for line in infile:
                if ':' not in line:
                    continue  # skip malformed lines

                # Split protection overhead and instruction list
                parts = line.strip().split(':')
                if len(parts) != 2:
                    continue  # skip malformed lines

                try:
                    protection_percent = int(parts[0].strip())
                    protected_inst_list = parts[1].strip().split()
                except ValueError:
                    continue  # skip if protection level is not a valid int
        
                if protection_percent not in selected_protection_level:
                    continue
        
                print("Number of protected instructions at protection level {}% is: {}".format(protection_percent, len(protected_inst_list)))
                
                
                current_protected_instlist_filepath = 'current-protected-inst-list.txt'
                
                with open(current_protected_instlist_filepath, 'w') as outfile:
                    for inst in protected_inst_list:
                        outfile.write(inst + '\n')
                        
                overhead = protection_percent / 100.0
                new_IR_path = protected_binary_path + "/" + appName + "-" + str(overhead) + ".ll"
                os.system("clang -S -emit-llvm external.c -o external.ll")
                os.system("opt -load ./SID.so " + appName + 
                        "-llfi_index.ll -sid -select_set_file=" + current_protected_instlist_filepath + " -o temp-no-link.ll")
                os.system("llvm-link external.ll temp-no-link.ll -o temp-unreadable.ll")
                os.system("llvm-dis temp-unreadable.ll -o " + new_IR_path)
                os.system("rm temp-* external.ll")
                
                
os.system("rm current-protected-inst-list.txt")
                
        
            
        
            
        