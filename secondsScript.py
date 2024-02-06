import time
from datetime import date, datetime

out_file = open('test.txt', 'w')
counter = 0
while True:
    out = "Harrison: " + str(date.today()) + " " + str(datetime.now().strftime("%H:%M:%S")) + " #" + str(counter)
    print(out, flush=True)
    out_file.write(out + '\n')
    out_file.flush()
    # flush = true print instantly
    counter += 1
    time.sleep(1)

# delete temp file after finishing script will crash otherwise
# ls -la and keep output then print out to see
# check permissions
# make a file in the way and try and run it
# journal ctl and log files to debug
# try: open file
# except PermissionExeption as E
# print (e)
# die
