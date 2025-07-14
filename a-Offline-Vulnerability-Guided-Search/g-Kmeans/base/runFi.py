import os, sys

bmName = sys.argv[1]
progInput = sys.argv[2]

input_args = progInput.strip().split(" ")

os.system("./datagen " + input_args[0])
progInput = "-i " + input_args[0] + ".txt -k " + input_args[1]
os.system("instrument --readable " + bmName + ".ll -lm")
os.system("profile llfi/" + bmName + "-profiling.exe " + progInput)
fiString = "injectfault llfi/" + bmName + "-faultinjection.exe " + progInput
print("Run FI with this command: " + fiString)
print(fiString)
os.system(fiString)
os.system("rm " + input_args[0] + ".txt")
