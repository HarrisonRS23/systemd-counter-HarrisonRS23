build:
	echo "Building..."
	echo "nothing to build"

run:
	echo "Running..."
	python3 bin/counter.py

test:
	echo "Testing..."
	pytest bin/test.py

clean: 
	echo "Cleaning..."
	sudo rm -f /usr/local/bin/counter.py
	rm -rf counter.deb
	rm -rf temp
	
build-deb:
	echo "Building deb..."
	./debBuild.sh
	
lint-deb:
	echo "Linting deb..."
	lintian counter.deb
