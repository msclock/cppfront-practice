find_package(spdlog CONFIG REQUIRED)
find_package(cppfront REQUIRED)

file(GLOB_RECURSE _srcs "src/*.cpp2")

set(target_name regression)
add_executable(${target_name} ${_srcs})

target_link_libraries(${target_name} PUBLIC spdlog::spdlog)

warn_target(${target_name})
harden_target(${target_name})
sanitize_target(${target_name})
target_code_coverage(${target_name} ALL)
cppfront_enable(TARGETS ${target_name})

if(BUILD_TESTING)
  add_test_subdirectory(tests)
endif()
