vcpkg_from_github(
  OUT_SOURCE_PATH
  SOURCE_PATH
  REPO
  hsutter/cppfront
  REF
  "v${VERSION}"
  SHA512
  84bef1ce7d4f381f4dfe94a7d6c12c0e900c2ea0d6664614536592a447e4c34028b1bc6a8fc7fd065d77334933239c55f3371e2786366d645acbf71b72951acd
  HEAD_REF
  main)

file(
  COPY "${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt"
       "${CMAKE_CURRENT_LIST_DIR}/CppfrontHelpers.cmake"
       "${CMAKE_CURRENT_LIST_DIR}/cppfront-config.cmake.in"
  DESTINATION "${SOURCE_PATH}")

vcpkg_cmake_configure(SOURCE_PATH "${SOURCE_PATH}")

vcpkg_cmake_install()
vcpkg_copy_pdbs()

vcpkg_cmake_config_fixup()

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share")

vcpkg_copy_tools(TOOL_NAMES cppfront AUTO_CLEAN)

