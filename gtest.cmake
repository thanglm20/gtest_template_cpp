########################### GTEST
# Enable ExternalProject CMake module
INCLUDE(ExternalProject)

find_package(Threads REQUIRED)

# Set default ExternalProject root directory
SET_DIRECTORY_PROPERTIES(PROPERTIES EP_PREFIX ${CMAKE_BINARY_DIR}/gtest)

# Set C++ standard
set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -Wall --std=c++11 -O2 -fPIC -rdynamic -g" )
SET(CMAKE_CXX_STANDARD 20)

ExternalProject_Add(
  googletest
  GIT_REPOSITORY https://github.com/google/googletest.git
  GIT_TAG release-1.10.0
  UPDATE_COMMAND ""
  INSTALL_COMMAND ""
  LOG_DOWNLOAD ON
  LOG_CONFIGURE ON
  LOG_BUILD ON)    

ExternalProject_Get_Property(googletest source_dir)
set(GTEST_INCLUDE_DIRS ${source_dir}/googletest/include)
set(GMOCK_INCLUDE_DIRS ${source_dir}/googlemock/include)

ExternalProject_Get_Property(googletest binary_dir)

add_library(gtest UNKNOWN IMPORTED)
set_target_properties(gtest PROPERTIES
  IMPORTED_LOCATION ${binary_dir}/lib/libgtest.a
  IMPORTED_LINK_INTERFACE_LIBRARIES "${CMAKE_THREAD_LIBS_INIT}")
add_dependencies(gtest googletest)

add_library(gmock UNKNOWN IMPORTED)
set_target_properties(gmock PROPERTIES
  IMPORTED_LOCATION ${binary_dir}/lib/libgmock.a
  IMPORTED_LINK_INTERFACE_LIBRARIES "${CMAKE_THREAD_LIBS_INIT}")
add_dependencies(gmock googletest)

add_library(gtest_main UNKNOWN IMPORTED)
set_target_properties(gtest_main PROPERTIES
  IMPORTED_LOCATION ${binary_dir}/lib/libgtest_main.a
  IMPORTED_LINK_INTERFACE_LIBRARIES "${CMAKE_THREAD_LIBS_INIT}")
add_dependencies(gtest_main googletest)

add_library(gmock_main UNKNOWN IMPORTED)
set_target_properties(gmock_main PROPERTIES
  IMPORTED_LOCATION ${binary_dir}/lib/libgmock_main.a
  IMPORTED_LINK_INTERFACE_LIBRARIES "${CMAKE_THREAD_LIBS_INIT}")
add_dependencies(gmock_main googletest)

# Unit test executable
add_executable(unit unit_main-t.cpp)

target_include_directories(unit PRIVATE 
                                ${GTEST_INCLUDE_DIRS}
                                ${GMOCK_INCLUDE_DIRS}
                                "${CMAKE_SOURCE_DIR}/libs/libconfigs"
                                "${CMAKE_SOURCE_DIR}/libs/liblogger"
                                "${CMAKE_SOURCE_DIR}/libs/liblogger/spdlog/include")
target_link_libraries(unit PRIVATE gtest gmock)