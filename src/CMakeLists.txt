cmake_minimum_required(VERSION 3.25)

project(
  ght
  VERSION 0.0.1
  LANGUAGES CXX
)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

include(ght-install-targets)
include(add_ght_module)
include(add_ght_executable)

add_subdirectory(core)
add_subdirectory(cli)