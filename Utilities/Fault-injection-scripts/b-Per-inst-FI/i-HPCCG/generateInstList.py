import sys

maxIndex = int(sys.argv[1])

with open("inst_list.txt", 'w') as f:
	for i in range(1, maxIndex+1):
		f.write(str(i) + "\n")
	
