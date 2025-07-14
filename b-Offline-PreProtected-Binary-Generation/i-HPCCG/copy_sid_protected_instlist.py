import os, sys

inputlistfilepath = sys.argv[1]
inputfolderpath = sys.argv[2]
outputfolderpath = sys.argv[3]

inputList = open(inputlistfilepath, 'r').readlines()

os.system("mkdir {}".format(outputfolderpath))

for eachInput in inputList:
    if eachInput != "\n":
        curInput = eachInput.replace("\n", "")
        
        outputfilepath = outputfolderpath + "/protected-inst-list-" + curInput.replace(" ", "-") + ".txt"
        inputfilepath = inputfolderpath + "/" + "sid-protection-{}".format(curInput.replace(" ", "-")) + "/optimal_instruction_sets.txt"
        
        os.system("cp {} {}".format(inputfilepath, outputfilepath)) 