build:
	echo "Building..."
	sudo service counter start 
	sudo systemctl daemon-reload
	sudo service counter status

run:
	echo "Running..."
	sudo service counter status

test:
	echo "Testing..."
	pytest bin/test.py

clean: 
	echo "Cleaning..."
	sudo rm -f /usr/local/bin/counter.py
	
build-deb:
	echo "Building deb..."
	-@if grep -q "^user:" /etc/passwd; then echo "make already ran"; else make build; fi
	./debBuild.sh
	
lint-deb:
	echo "Linting deb..."
	lintian counter.deb

clean-deb:
	echo "Cleaning deb..."
	rm -rf counter.deb
	rm -rf temp
