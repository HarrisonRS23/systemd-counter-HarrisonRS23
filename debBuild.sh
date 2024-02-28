#!/bin/sh

TEMP_DIR=temp

echo "Starting Deb package Build"

echo "Making temp directory tree"
mkdir -p $TEMP_DIR
mkdir -p $TEMP_DIR/etc/
mkdir -p $TEMP_DIR/usr/bin/
mkdir -p $TEMP_DIR/DEBIAN

echo "Copy control file for Debian/"
cp src/DEBIAN/control $TEMP_DIR/DEBIAN/

echo "confiles setup for Debian"
cp src/DEBIAN/conffiles $TEMP_DIR/DEBIAN/

echo "copy binary into place"
cp bin/counter.py $TEMP_DIR/usr/bin/

echo "Configuration file into place" 
cp src/counter.conf $TEMP_DIR/etc/

echo "Copy postinst and prerm to the temp debian"
cp src/DEBIAN/postinst $TEMP_DIR/DEBIAN/
cp src/DEBIAN/prerm $TEMP_DIR/DEBIAN/
cp src/DEBIAN/preinst $TEMP_DIR/DEBIAN/
chmod 755 $TEMP_DIR/DEBIAN/preinst
chmod 755 $TEMP_DIR/DEBIAN/postinst
chmod 755 $TEMP_DIR/DEBIAN/prerm

cp src/counter.service $TEMP_DIR/usr/bin/

echo "Building deb file"
dpkg-deb --root-owner-group --build $TEMP_DIR
mv $TEMP_DIR.deb counter.deb