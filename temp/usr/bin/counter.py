import time
import signal
import sys
from datetime import date, datetime

def open_file():
    try:
        out_file = open('/tmp/currentCount.out' , 'w')
    except PermissionError as e:
        print("Error: ", e)
        sys.exit()
    return out_file

def term_handler(signum, frame, out_file):
    out = "Harrison: " + str(date.today()) + " " + str(datetime.now().strftime("%H:%M:%S")) + " Received SIGTERM, exiting..."
    print(out, flush=True)
    out_file.write(out + '\n')
    out_file.flush()
    out_file.close()
    sys.exit()

def output(counter, out_file):
    out = "Harrison: " + str(date.today()) + " " + str(datetime.now().strftime("%H:%M:%S")) + " #" + str(counter)
    print(out)
    out_file.write(out + '\n')
    out_file.flush()
    time.sleep(1)

def run_counter():
    signal.signal(signal.SIGTERM, lambda signum, frame: term_handler(signum, frame, out_file))
    out_file = open_file()
    counter = 0
    while True:
        output(counter, out_file)
        counter += 1

# Run the counter if executed as a script
if __name__ == "__main__":
    run_counter()
