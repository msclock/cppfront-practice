cmake_minimum_required(VERSION 3.30)
message(STATUS "CMAKE VERSION:${CMAKE_VERSION}")

# Project settings
project(
  cppfront-practice
  LANGUAGES CXX C
  HOMEPAGE_URL "https://github.com/msclock/cppfront-practice"
  DESCRIPTION "Practice based on cppfront")

set(CMAKE_CXX_STANDARD
    23
    CACHE STRING "C++ standard")
set(CMAKE_CXX_STANDARD_REQUIRED
    ON
    CACHE BOOL "C++ standard required")
set(CMAKE_CXX_EXTENSIONS
    OFF
    CACHE BOOL "C++ extensions")

# Source includes from vcpkg
include_directories(${VCPKG_INSTALLED_DIR}/${VCPKG_TARGET_TRIPLET}/include)

# From https://github.com/msclock/cmake-registry.
find_package(cmake-modules REQUIRED)
include(cmake-modules/ProjectDefault)

# Project custom modules
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")
include(ConfigureWarningsAndHardening)
include(ConfigureVersion)
include(ConfigureDocs)
include(ConfigureCoverage)

add_subdirectory(src)
