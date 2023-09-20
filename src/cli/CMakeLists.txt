add_ght_executable(cli)

target_sources(${ght_executable_target} PRIVATE src/main.cpp)

target_link_libraries(${ght_executable_target}
  PRIVATE
    ght::core
)