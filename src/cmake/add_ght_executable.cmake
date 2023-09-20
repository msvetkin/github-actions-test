include_guard(GLOBAL)

include(set_ght_target_properties)

# sets all nessary default things
function(add_ght_executable executable_name)
  set(executable_target ght-${executable_name})

  add_executable(${executable_target} ${ARGN})
  set_ght_target_properties(${executable_target} PRIVATE)

  if (TARGET ght)
    install(TARGETS ${executable_target} EXPORT ght-targets)
  endif()

  set(ght_executable_target
      ${executable_target}
      PARENT_SCOPE
  )
endfunction()