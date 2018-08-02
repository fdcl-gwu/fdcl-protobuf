# Minimum CMake required
cmake_minimum_required(VERSION 3.9)

# Project
project(fdcl-protobuf)

# add_subdirectory("extern/protobuf/cmake")
# Find required protobuf package

find_package(Protobuf REQUIRED
    HINTS
    "extern/protobuf")

if (NOT Protobuf_FOUND)
    message(STATUS "This project requires Protobuf and will not compile")
    return()
else()
    message(STATUS "Found Protobuf: ${Protobuf_VERSION}")
endif()
