import time
import signal
import sys
from datetime import date, datetime

# Our signal handler
# def signal_handler(signum, frame):  
 #   print("Signal Number:", signum, " Frame: ", frame)  
 
# def exit_handler(signum, frame):
 #    print('Exiting....')
 #    exit(0)

def term_handler(signum, frame):
    out = "Harrison: " + str(date.today()) + " " + str(datetime.now().strftime("%H:%M:%S")) + " Recieved SIGTERM, exiting..."
    print (out, flush=True)
    out_file.write(out + '\n')
    out_file.flush()
    out_file.close()
    sys.exit()
 
# Register our signal handler with `SIGINT`(CTRL + C)
# signal.signal(signal.SIGINT, signal_handler)

# Register our signal handler with `SIGTERM`
signal.signal(signal.SIGTERM, term_handler)
 
# Register the exit handler with `SIGTSTP` (Ctrl + Z)
# signal.signal(signal.SIGTSTP, exit_handler)
try:
    out_file = open('/tmp/currentCount.out', 'w')
except PermissionExeption as e:
    print("Error: ", e)
    sys.exit()

counter = 0
while True:
    out = "Harrison: " + str(date.today()) + " " + str(datetime.now().strftime("%H:%M:%S")) + " #" + str(counter)
    print(out)
    out_file.write(out + '\n')
    # out_file.flush()
    # flush = true print instantly
    counter += 1
    time.sleep(1)

out_file.close()
# delete temp file after finishing script will crash otherwise
# ls -la and keep output then print out to see
# check permissions
# make a file in the way and try and run it
# journal ctl and log files to debug
# try: open file
# except PermissionExeption as E
# print (e)
# die
