# Minimum CMake required
cmake_minimum_required(VERSION 3.9)

# Project
project(fdcl-protobuf)
find_package(Protobuf 3.6.1 CONFIG REQUIRED)

if (NOT Protobuf_FOUND)
    message(STATUS "This project requires Protobuf and will not compile")
    return()
else()
    message(STATUS "Found Protobuf: ${Protobuf_VERSION}")
endif()

PROTOBUF_GENERATE_CPP(PROTO_SRC PROTO_HDR proto/message.proto)
