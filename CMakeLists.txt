# Minimum CMake required
cmake_minimum_required(VERSION 3.9)

# Project
project(fdcl-protobuf)

add_subdirectory("extern/protobuf/cmake")
# Find required protobuf package
find_package(Protobuf 3.6.1 CONFIG REQUIRED)

