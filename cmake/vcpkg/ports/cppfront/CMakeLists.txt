cmake_minimum_required(VERSION 3.30)
project(cppfront LANGUAGES CXX)

add_executable(cppfront source/cppfront.cpp)
add_executable(cppfront::cppfront ALIAS cppfront)
set_target_properties(cppfront PROPERTIES OUTPUT_NAME cppfront EXPORT_NAME
                                                               cppfront)
target_compile_features(cppfront PRIVATE cxx_std_20)
target_compile_options(cppfront PRIVATE $<$<CXX_COMPILER_ID:MSVC>:/bigobj>)
if(WIN32 AND MINGW)
  target_compile_options(cppfront PRIVATE -mbig-obj)
endif()
target_sources(
  cppfront
  PRIVATE FILE_SET
          HEADERS
          BASE_DIRS
          source
          FILES
          source/common.h
          source/io.h
          source/lex.h
          source/parse.h
          source/reflect.h
          source/sema.h)

add_library(cpp2util INTERFACE)
add_library(cppfront::cpp2util ALIAS cpp2util)
set_target_properties(cpp2util PROPERTIES EXPORT_NAME cpp2util)

target_compile_features(cpp2util INTERFACE cxx_std_20)
target_sources(
  cpp2util
  INTERFACE FILE_SET
            HEADERS
            BASE_DIRS
            include
            FILES
            include/cpp2util.h
            include/cpp2regex.h)

# Installation and CMake packaging logic

include(CMakePackageConfigHelpers)
configure_package_config_file(
  "${CMAKE_CURRENT_SOURCE_DIR}/cppfront-config.cmake.in"
  "${CMAKE_CURRENT_BINARY_DIR}/cppfront-config.cmake"
  INSTALL_DESTINATION share/cppfront)

install(
  FILES "${CMAKE_CURRENT_BINARY_DIR}/cppfront-config.cmake"
        "${CMAKE_CURRENT_SOURCE_DIR}/CppfrontHelpers.cmake"
  DESTINATION share/cppfront
  COMPONENT cppfront)

include(GNUInstallDirs)
install(
  TARGETS cppfront cpp2util
  EXPORT cppfront-targets
  FILE_SET HEADERS
  COMPONENT cppfront)

install(
  EXPORT cppfront-targets
  DESTINATION share/cppfront
  NAMESPACE cppfront::
  COMPONENT cppfront)
