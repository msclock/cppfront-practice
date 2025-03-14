cmake_minimum_required(VERSION 3.30)
message(STATUS "CMAKE VERSION:${CMAKE_VERSION}")

# Project settings
project(
  cppfront-practice
  LANGUAGES CXX C
  HOMEPAGE_URL "https://github.com/msclock/cppfront-practice"
  DESCRIPTION "Practice based on cppfront")

# Project default module
find_package(cmake-modules REQUIRED)
include(cmake-modules/ProjectDefault)
include(ConfigureVersion)
include(ConfigureCoverage)
include(ConfigureDocs)

add_subdirectory(src)
