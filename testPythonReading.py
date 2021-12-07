import time

with open('./root_folder/dir1/.honey1.pdf', 'rb') as hfile:
    time.sleep(10)
print("Out of the loop")
time.sleep(60)
