cmake_minimum_required(VERSION 3.25)

set(TARGET_NAME "module2")

project(${TARGET_NAME} DESCRIPTION "")

set(CMAKE_CXX_STANDARD 20)


add_library(${TARGET_NAME} STATIC src/module2.cpp)
# add_executable(${PROJECT_NAME} src/module2.cpp)
target_include_directories(${TARGET_NAME} PUBLIC
                        "${CMAKE_SOURCE_DIR}/libs/module2/include")

                        
# Unit tests
target_sources(unit PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/unit/module2-t.cpp")
target_include_directories(unit PRIVATE
                        "${CMAKE_SOURCE_DIR}/libs/module2/include")
target_link_libraries(unit PRIVATE ${TARGET_NAME})