add_ght_module(core)

target_sources(${ght_module_target} PRIVATE
  include/ght/core/version.hpp
  src/version.cpp)