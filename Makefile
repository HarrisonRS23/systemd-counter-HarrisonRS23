build:
	echo "Building..."
	sudo cp bin/counter.py /usr/local/bin/counter.py
	sudo chmod +x /usr/local/bin/counter.py
	sudo cp bin/counter.service /lib/systemd/system/counter.service
	sudo useradd --system user
	sudo systemctl daemon-reload
	sudo service counter status

run:
	echo "Running..."
	sudo service counter start 
	echo "Enabling..."
	sudo systemctl enable counter.service
	sudo service counter status

test:
	echo "Testing..."
	pytest bin/test.py

clean: 
	echo "Cleaning..."
	-@if [ -f /tmp/currentCount.out ]; then sudo rm /tmp/currentCount.out; else echo "File /tmp/currentCount.out does not exist"; fi
	-@if [ -f /usr/local/bin/counter.py ]; then sudo rm /usr/local/bin/counter.py; else echo "File /usr/local/bin/counter.py does not exist"; fi
	-sudo service counter stop || echo "Service counter is not running"
	-@if [ -f /lib/systemd/system/counter.service ]; then sudo rm /lib/systemd/system/counter.service; else echo "File /lib/systemd/system/counter.service does not exist"; fi
	-@if grep -q "^user:" /etc/passwd; then sudo userdel user; else echo "user does not exist"; fi
	sudo systemctl daemon-reload

build-deb:
	echo "Building deb..."
	-@if grep -q "^user:" /etc/passwd; then echo "make already ran"; else make build; fi
	./debBuild.sh
	
lint-deb:
	echo "Linting deb..."
	lintian counter.deb
