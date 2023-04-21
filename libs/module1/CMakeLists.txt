cmake_minimum_required(VERSION 3.25)

set(TARGET_NAME "module1")

project(${TARGET_NAME} DESCRIPTION "")

set(CMAKE_CXX_STANDARD 20)


add_library(${TARGET_NAME} STATIC src/module1.cpp)
# add_executable(${PROJECT_NAME} src/module1.cpp)
target_include_directories(${TARGET_NAME} PUBLIC
                        "${CMAKE_SOURCE_DIR}/libs/module1/include")

                        
# Unit tests
target_sources(unit PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/unit/module1-t.cpp")
target_include_directories(unit PRIVATE
                        "${CMAKE_SOURCE_DIR}/libs/module1/include")
target_link_libraries(unit PRIVATE ${TARGET_NAME})