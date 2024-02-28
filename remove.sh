#!/bin/bash

if [ -f /tmp/currentCount.out ]; then
    sudo rm /tmp/currentCount.out
else
    echo "File /tmp/currentCount.out does not exist"
fi

if [ -f /usr/local/bin/counter.py ]; then
    sudo rm /usr/local/bin/counter.py
else
    echo "File /usr/local/bin/counter.py does not exist"
fi

sudo service counter stop || echo "Service counter is not running"

if [ -f /lib/systemd/system/counter.service ]; then
    sudo rm /lib/systemd/system/counter.service
else
    echo "File /lib/systemd/system/counter.service does not exist"
fi

if grep -q "^user:" /etc/passwd; then
    sudo userdel user
else
    echo "user does not exist"
fi

sudo systemctl daemon-reload