#!/bin/bash

PROTOBUF_VER=3.6.1
INSTALL_DIR="/usr/local/protobuf"
# HDF5_RELEASE_URL="https://support.hdfgroup.org/ftp/HDF5/current/src/hdf5-${HDF5_VER}.tar.gz"
PROTOBUF_URL="https://github.com/google/protobuf.git"
TEMP_DIR="$(mktemp -d)"

# This will download the latest eigen and install for the sy tem
echo "Going to install v${PROTOBUF_VER} Google Protocol Buffers"
read -p "Press Enter to continue........"

# download  latest release of eigen
if [[ ! "$TEMP_DIR" || ! -d "$TEMP_DIR" ]]; then
	echo "Could not create temp dir"
	exit 1
fi

# delete the temp directory on cleanup
function cleanup {
    rm -rf "$TEMP_DIR"
    echo "Deleted temp working directory $TEMP_DIR"
}

trap cleanup EXIT

echo "We're going to download the repo to ${INSTALL_DIR}"
cd ${TEMP_DIR}
git clone ${PROTOBUF_URL} 

echo "Going to install using the configure script"
read -p "Press enter to continue"
cd protobuf
git submodule update --init --recursive
./autogen.sh

./configure --prefix=${INSTALL_DIR}
make
make check

read -p "Press enter to exit"
