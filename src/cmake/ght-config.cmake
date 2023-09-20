include(CMakeFindDependencyMacro)

find_dependency(fmt)
find_dependency(Microsoft.GSL)
find_dependency(range-v3)

include("${CMAKE_CURRENT_LIST_DIR}/ght-targets.cmake")