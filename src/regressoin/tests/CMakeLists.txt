find_package(GTest CONFIG REQUIRED)

include(GoogleTest)

file(GLOB files "*.cpp2")

foreach(_file ${files})
  get_filename_component(file_basename ${_file} NAME_WE)
  add_executable(${file_basename} ${_file})
  target_link_libraries(${file_basename} PRIVATE GTest::gtest_main)
  warn_target(${file_basename})
  harden_target(${file_basename})
  sanitize_target(${file_basename})
  target_code_coverage(${file_basename} ALL)
  gtest_discover_tests(${file_basename})
  cppfront_enable(TARGETS ${file_basename})
endforeach()
