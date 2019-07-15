cmake_minimum_required(VERSION 3.10)
project(homie-cpp)

set(CMAKE_CXX_STANDARD 14)

# install homie-cpp
install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/
    DESTINATION include
    FILES_MATCHING PATTERN "*.h*")