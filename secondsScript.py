import time
from datetime import date, datetime

out_file = open('test.txt', 'w')
counter = 0
while True:
    out = "Harrison: " + str(date.today()) + " " + str(datetime.now().strftime("%H:%M:%S")) + " #" + str(counter)
    print(out)
    out_file.write(out + '\n')
    out_file.flush()
    # flush = true print instantly
    counter += 1
    time.sleep(1)
