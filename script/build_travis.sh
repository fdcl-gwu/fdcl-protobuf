#!/bin/bash

EIGEN_VER=3.3.4
INSTALL_DIR="/usr/local/include"
EIGEN_RELEASE_URL="https://github.com/eigenteam/eigen-git-mirror/archive/${EIGEN_VER}.tar.gz"
TEMP_DIR="$(mktemp -d)"
WORK_DIR="$(pwd)"

PROTOBUF_VER=3.6.1
INSTALL_DIR="/usr/local/protobuf"

# download  latest release of eigen
if [[ ! "$TEMP_DIR" || ! -d "$TEMP_DIR" ]]; then
	echo "Could not create temp dir"
	exit 1
fi

echo "Download some dependencies"
sudo apt-get -y install autoconf automake libtool curl make g++ unzip

echo "We're going to download Eigen ${EIGEN_VER} and install to ${INSTALL_DIR}"
cd ${TEMP_DIR}
mkdir ${EIGEN_VER}
wget ${EIGEN_RELEASE_URL} -O ${TEMP_DIR}/${EIGEN_VER}.tar.gz
tar -xvzf ${EIGEN_VER}.tar.gz -C ./${EIGEN_VER} --strip-components=1

echo "Going to install Eigen using CMake"
cd ${EIGEN_VER}
mkdir build
cd build
cmake ..
sudo make install

echo "Eigen installed"

# This will download the latest eigen and install for the sy tem
echo "Going to install v${PROTOBUF_VER} Google Protocol Buffers"

echo "We're going to download the repo to ${INSTALL_DIR}"
cd ${TEMP_DIR}
git clone ${PROTOBUF_URL} 

echo "Going to install using the configure script"
cd protobuf
git submodule update --init --recursive
./autogen.sh

./configure --prefix=${INSTALL_DIR}
make -j4
make -j4 check
sudo make install

echo "Finished Protobuf install"
