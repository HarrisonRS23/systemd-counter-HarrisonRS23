build:
	echo "Building..."
	echo "nothing to build"

run:
	echo "Running..."
	python3 bin/counter.py

test:
	echo "Testing..."
	pip3 install pytest
	pytest bin/test.py

clean: 
	echo "Cleaning..."
	sudo rm -f /usr/local/bin/counter.py
	rm -rf counter-v2.0.0.deb
	rm -rf temp
	
build-deb:
	echo "Building deb..."
	./debBuild.sh
	
lint-deb:
	echo "Linting deb..."
	lintian counter.deb
