import time

with open('./root_folder/dir1/.honey1.pdf', 'rb') as hfile:
    time.sleep(0.5)
print("Out of the loop")
time.sleep(3)
print("Done")
