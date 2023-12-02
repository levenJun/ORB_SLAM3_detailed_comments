#!/bin/bash

set -e
set -v

sudo apt install libgl1-mesa-dev mesa-common-dev libglu1-mesa-dev -y
sudo apt install libglew-dev -y

# VERSION="3.4.8"
TARFILE="Pangolin"
TARFILE_PACK=${TARFILE}.zip
if [ ! -f "./$TARFILE_PACK" ]; then
	echo 'Cannot find opencv target file:'${TARFILE_PACK}
	exit -1
fi

unzip ${TARFILE_PACK}

cd ${TARFILE}

mkdir build && cd build && cmake ..
make -j 8
sudo make install

if [ True ]; then
  cd ../..
  rm -rf ${TARFILE}
fi
