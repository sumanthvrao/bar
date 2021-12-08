# 1 - malware file
# 0 - Normal file
# 

import os
import sys

from byte_stats import calc_stats

def RunEntropyCheck(file):
    path = os.path.abspath(file)
    entropyList = calc_stats.CalculateEntropy(path)
    # print(entropyList)
    if(len(entropyList) < 2):
        raise "File contents are empty"
        return -1
    # entropyList[1] = average entropy
    # entropyList[2] = variance
    # entropyList[3] = average entropy
    # entropyList[4] = average entropy
    mean = entropyList[1]
    stdDeviation = entropyList[2]
    print("mean : {}, std_dev : {}" .format(mean, stdDeviation))
    if(len(entropyList) > 4):
        perBucketEntropy = entropyList[5]
        print("per bucket entropy: {}" .format(perBucketEntropy))

    return mean

if __name__ == '__main__':
    if len(sys.argv) < 2:
        raise "Usage: driver.py [path]"
    mean = RunEntropyCheck(sys.argv[1])
    return mean