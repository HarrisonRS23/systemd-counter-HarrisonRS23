build:
	echo "Building..."

run:
	echo "Running..."
	python3 bin/counter.py

test:
	echo "Testing..."
	pytest bin/test.py

clean: 
	echo "Cleaning..."
	sudo rm -f /usr/local/bin/counter.py
	
build-deb:
	echo "Building deb..."
	./debBuild.sh
	
lint-deb:
	echo "Linting deb..."
	lintian counter.deb

clean-deb:
	echo "Cleaning deb..."
	rm -rf counter.deb
	rm -rf temp
