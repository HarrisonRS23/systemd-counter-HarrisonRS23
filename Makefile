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
	rm -rf counter-v2.0.0.deb
	rm -rf temp
	
build-deb:
	echo "Building deb..."
	./debBuild.sh
	
lint-deb:
	echo "Linting deb..."	
	-lintian counter-v2.0.0.deb
docker-image:
	echo "Making docker image"
	docker build -t counter:latest .
docker-run:
	echo "mounting and running image"
	docker run --rm --mount type=bind,source=/tmp,target=/tmp counter:latest
