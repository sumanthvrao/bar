# BAR: A Ransomware Detection Tool Suite
CSE 227 Project


Run the driver.py using Python2 (some libraries use python2 so I kept it as such). No additional dependencies are needed.

The syntax is `python2 driver.py path_to_file`

The output is the mean entropy and the standard division of the buckets.
I haven't set a threshold for these since you'll be testing them in practice.
The mean ranges between 0.0 to 8.0. I found compressed files (~ encrypted files) have > 6.0, and normal files have <= 6.0.
If you find this consistent, you can just add a filter condition in the script. 

Also, I kept the standard deviation as is, since some files have buckets with low entropy (which means parts of the file are not encrypted, hence recoverable).
This sounds like an interesting data point and maybe we can think of something with it.
