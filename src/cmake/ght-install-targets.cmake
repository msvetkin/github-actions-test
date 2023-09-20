include_guard(GLOBAL)

include(GNUInstallDirs)

add_library(ght INTERFACE)
add_library(ght::ght ALIAS ght)
install(TARGETS ght EXPORT ght-targets)

export(EXPORT ght-targets NAMESPACE ght::)
configure_file("cmake/ght-config.cmake" "." COPYONLY)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
  ght-config-version.cmake COMPATIBILITY SameMajorVersion
)

install(
  EXPORT ght-targets
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/ght
  NAMESPACE ght::
)

install(
  FILES cmake/ght-config.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/ght-config-version.cmake
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/ght
)
