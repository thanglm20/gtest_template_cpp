cmake_minimum_required(VERSION 3.25)

project(app DESCRIPTION "")

set(CMAKE_CXX_STANDARD 20)


add_executable(${PROJECT_NAME} main.cpp)

target_include_directories(${PROJECT_NAME} PUBLIC
                        "${CMAKE_SOURCE_DIR}/libs/module2/include")

target_link_libraries(${PROJECT_NAME} module2)
