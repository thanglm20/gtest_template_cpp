cmake_minimum_required(VERSION 3.25)
project(SDKClient-Deepstream)

include(${CMAKE_SOURCE_DIR}/gtest.cmake)

add_subdirectory(libs/module1)
add_subdirectory(libs/module2)

add_subdirectory(apps)
