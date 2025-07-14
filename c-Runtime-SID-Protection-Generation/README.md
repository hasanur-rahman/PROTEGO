## Instructions

This folder contains scripts to run online phase of PROTEGO. Specifically, given an online input, the script first run the pre-trained MLP model based on extracted input argument-based features and estimate overall SDC vulnerability of the application under that input. Finally, Based on the estimated SDC vulnerability, the script finds an appropriate SID protected binary from the pre-generated pool of representative SID binaries. 

Within each application folder, the steps are as follows.
1. Fill out `test.csv` file with online inputs. You can also put their actual SDC vulnerabilities (from fault injections from `Utilities` folder) to let the script `select_appropriate_protected_binary.py` later assess the mean absolute error of the estimation. For testing purposes, `test.csv` file contains 3 runtime inputs for the users to check our script.
2. Run `python select_appropriate_protected_binary.py train.csv test.csv <0/1>`. Here `<0/1>` determines whether you want to run the script with pre-trained MLP model for inference, or you want to first train the model followed by inference.