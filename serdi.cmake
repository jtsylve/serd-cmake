# SPDX-FileCopyrightText: © 2023 Joe T. Sylve, Ph.D. <joe.sylve@gmail.com>
#
# SPDX-License-Identifier: ISC

add_executable(serdi)
add_executable(serd::serdi ALIAS serdi)

target_sources(serdi 
  PRIVATE
    ${serd-source_SOURCE_DIR}/src/serdi.c
)

target_link_libraries(serdi
  PRIVATE
    serd
    serd-config
)

set_target_properties(serdi 
  PROPERTIES
    C_STANDARD          99
    C_STANDARD_REQUIRED ON
    C_EXTENSIONS        OFF
)

install(TARGETS serdi
  RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)