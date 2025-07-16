Deploying Lightweight Input-Aware Selective Instruction Duplication in HPC Applications
====

* Will Appear in the Proceedings of the International Conference for High Performance Computing, Networking, Storage and Analysis (SC), 2025. 
* Authors: Md Hasanur Rahman and Guanpeng Li. 


## Contents
1. `a-Offline-Vulnerability-Guided-Search`: This performs our one-time fault injection-based vulnerability-guided offline search.
2. `b-Offline-PreProtected-Binary-Generation`: Based on our vulnerability-based search analysis, this first form a handful of representative input groups. Within each group, a representative SID protected binary is generated and saved.
3. `c-Runtime-SID-Protection-Generation`: Given an online input at runtime, this can efficiently selects an accurate protected binary from the pool of pre-generated representative binaries.
4. `Utilities`: This contains LLVM-compiled applications and fault injection experiments.

## License

**Until the conclusion of the SC'25 conference (Nov 16-21, 2025), this source code is proprietary and allowed for viewing only. Until then, the source code cannot be copied, modified, distributed, or used for any purpose without the explicit written permission of the author.**

© Md Hasanur Rahman, 2025. All rights reserved.
