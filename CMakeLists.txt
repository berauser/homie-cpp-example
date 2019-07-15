cmake_minimum_required(VERSION 3.10)
project(homie-cpp)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_VERBOSE_MAKEFILE OFF)

set(STAGING_DIR     "${PROJECT_SOURCE_DIR}/staging_dir")
set(INCLUDE_DIR     "${STAGING_DIR}/include/")
set(MODULES_DIR     "${PROJECT_SOURCE_DIR}/modules")
set(RESOURCES_DIR   "${PROJECT_SOURCE_DIR}/modules/resources")

include(ExternalProject)

list(APPEND CMAKE_MODULE_PATH 
  ${PROJECT_SOURCE_DIR}
  ${MODULES_DIR}
)

include(homie-cpp)
include(paho-mqtt-c)

add_subdirectory(source)