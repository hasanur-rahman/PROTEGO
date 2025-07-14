import os, sys
import subprocess
import time

###############################
bmName = sys.argv[1]
theInput = sys.argv[2]
###############################

# Read input list
instList = open('inst_list.txt', 'r').readlines()

jobQ = []
for eachInst in instList:
	if eachInst != "\n":
		# Launch FI for the inst
		eachInst = eachInst.replace("\n", "")
		instFolderName = bmName + "-" + eachInst
		os.system("cp -r base " + instFolderName)
		os.chdir(instFolderName)
		# Replace XXXX in input.yaml with inst index
		inf = open("input.yaml", 'r') 
		newInp = inf.read().replace("XXXX", eachInst)
		outf = open("input.yaml", 'w')
		outf.write(newInp)
		inf.close()
		outf.close()
		os.system("python runFi.py " + bmName + " " + theInput)
		os.chdir("../")
