# SPDX-FileCopyrightText: © 2023 Joe T. Sylve, Ph.D. <joe.sylve@gmail.com>
#
# SPDX-License-Identifier: ISC

if (SERD_STATIC)
  add_library(serd STATIC)
else()
  add_library(serd SHARED)
endif()
add_library(serd::serd ALIAS serd)

set_target_properties(serd 
  PROPERTIES
    C_STANDARD          99
    C_STANDARD_REQUIRED ON
    C_EXTENSIONS        OFF
    C_VISIBILITY_PRESET hidden
    VERSION             ${PROJECT_VERSION}
    SOVERSION           ${PROJECT_VERSION_MAJOR}
)

target_sources(serd
  PUBLIC
    FILE_SET HEADERS
      BASE_DIRS
        ${serd_SOURCE_DIR}/include
      FILES
        ${serd_SOURCE_DIR}/include/serd/serd.h
  
  PRIVATE
    ${serd_SOURCE_DIR}/src/base64.c
    ${serd_SOURCE_DIR}/src/byte_source.c
    ${serd_SOURCE_DIR}/src/env.c
    ${serd_SOURCE_DIR}/src/n3.c
    ${serd_SOURCE_DIR}/src/node.c
    ${serd_SOURCE_DIR}/src/reader.c
    ${serd_SOURCE_DIR}/src/string.c
    ${serd_SOURCE_DIR}/src/system.c
    ${serd_SOURCE_DIR}/src/uri.c
    ${serd_SOURCE_DIR}/src/writer.c
)

target_include_directories(serd
  PUBLIC
    $<BUILD_INTERFACE:${serd_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
)

target_link_libraries(serd
  PRIVATE
    serd-config
)

include(GNUInstallDirs)

install(TARGETS serd
  RUNTIME DESTINATION  ${CMAKE_INSTALL_BINDIR}
  LIBRARY DESTINATION  ${CMAKE_INSTALL_LIBDIR}
  ARCHIVE DESTINATION  ${CMAKE_INSTALL_LIBDIR}

  FILE_SET HEADERS
    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
)

