import os

a = input("what did you do?  ")
os.system("git add .")
os.system("git commit -m {}".format(a))
os.system("git push origin main")