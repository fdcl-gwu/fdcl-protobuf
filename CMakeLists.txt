# Minimum CMake required
cmake_minimum_required(VERSION 3.9)

# Project
project(fdcl-protobuf)

# Find required protobuf package
find_package(Protobuf CONFIG REQUIRED)

if(protobuf_VERBOSE)
  message(STATUS "Using Protocol Buffers ${Protobuf_VERSION}")
endif()
