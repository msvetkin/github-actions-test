# SPDX-FileCopyrightText: Copyright 2023 Mikhail Svetkin
# SPDX-License-Identifier: MIT

add_ght_module(core INTERFACE)

target_sources(${ght_module_target} PRIVATE
  include/ght/core/version.hpp)

target_link_libraries(${ght_module_target} INTERFACE fmt::fmt)
