cmake_minimum_required(VERSION 3.8)
project(Cardinal)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR})
set(SOURCE_FILES Engine/Main.cpp)
add_executable(Cardinal ${SOURCE_FILES})