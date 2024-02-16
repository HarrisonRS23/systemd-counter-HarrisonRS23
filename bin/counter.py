import time
import signal
import sys
from datetime import date, datetime

def term_handler(signum, frame):
    out = "Harrison: " + str(date.today()) + " " + str(datetime.now().strftime("%H:%M:%S")) + " Recieved SIGTERM, exiting..."
    print (out, flush=True)
    out_file.write(out + '\n')
    out_file.flush()
    out_file.close()
    sys.exit()

# Register our signal handler with `SIGTERM`
signal.signal(signal.SIGTERM, term_handler)

try:
    out_file = open('/tmp/currentCount.out' , 'w')
except PermissionError as e:
    print("Error: ", e)
    sys.exit()

counter = 0
while True:
    out = "Harrison: " + str(date.today()) + " " + str(datetime.now().strftime("%H:%M:%S")) + " #" + str(counter)
    print(out)
    out_file.write(out + '\n')
    out_file.flush()
    counter += 1
    time.sleep(1)
    
