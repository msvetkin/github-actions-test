# SPDX-FileCopyrightText: Copyright 2023 Mikhail Svetkin
# SPDX-License-Identifier: MIT

include_guard(GLOBAL)

include(GNUInstallDirs)

# global target
add_library(ght INTERFACE)
add_library(ght::ght ALIAS ght)
install(TARGETS ght EXPORT ght-targets)

# local build
export(EXPORT ght-targets NAMESPACE ght::)
configure_file("cmake/ght-config.cmake" "." COPYONLY)

include(CMakePackageConfigHelpers)
write_basic_package_version_file(
  ght-config-version.cmake COMPATIBILITY SameMajorVersion
)

# installation
install(
  EXPORT ght-targets
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/ght
  NAMESPACE ght::
)

install(
  FILES cmake/ght-config.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/ght-config-version.cmake
        ${CMAKE_CURRENT_BINARY_DIR}/ght-config-version.cmake
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/ght
)

# sets all nessary default things
function(add_ght_module module_name)
  set(module_target ght_${module_name})
  set(module_alias ght::${module_name})

  add_library(${module_target} ${ARGN})
  add_library(${module_alias} ALIAS ${module_target})

  get_target_property(module_target_type ${module_target} TYPE)
  if("${module_target_type}" STREQUAL "INTERFACE_LIBRARY")
    set(module_type "INTERFACE")
  else()
    set(module_type "PUBLIC")
  endif()

  target_include_directories(
    ${module_target} ${module_type}
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
  )
  set_target_properties(${module_target} PROPERTIES EXPORT_NAME ${module_name})

  target_link_libraries(${module_target} ${module_type})

  install(TARGETS ${module_target} EXPORT ght-targets)
  install(DIRECTORY include/ght/${module_name} TYPE INCLUDE)

  target_link_libraries(ght INTERFACE ${module_target})

  set(ght_module_target
      ${module_target}
      PARENT_SCOPE
  )
endfunction()
