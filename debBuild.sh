#!bin/bash

TEMP_DIR=temp

echo "Starting Deb package Build"

echo "Making temp directory tree"
mkdir -p $TEMP_DIR
mkdir -p $TEMP_DIR/etc/
mkdir -p $TEMP_DIR/usr/bin/
mkdir -p $TEMP_DIR/DEBIAN

echo "Copy control file for Debian/" 

echo "confiles setup for Debian"

echo "copy binary into place"

echo "Configuration file into place" 

echo "Building deb file"
dpkg-deb --root-owner-group --build $TEMP_DIR
mv $TEMP_DIR.deb $TEMP_DIR.deb