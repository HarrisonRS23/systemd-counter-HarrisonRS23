#!/bin/bash

echo "Installing..."
sudo cp bin/counter.py /usr/local/bin/counter.py
sudo chmod +x /usr/local/bin/counter.py
sudo cp bin/counter.service /lib/systemd/system/counter.service

echo "installed"
