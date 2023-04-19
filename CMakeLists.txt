# SPDX-FileCopyrightText: © 2023 Joe T. Sylve, Ph.D <joe.sylve@gmail.com>
#
# SPDX-License-Identifier: ISC

cmake_minimum_required(VERSION 3.23.0)

project(serd 
    VERSION         0.30.16
    DESCRIPTION     "Serd is a lightweight C library for working with RDF data."
    HOMEPAGE_URL    https://drobilla.net/software/serd
    LANGUAGES       C
)

# Options
include(options.cmake)

# Configuration
include(config.cmake)

# Fetch source code
include(source.cmake)

# Library
include(libserd.cmake)

# Tools
if (SERD_BUILD_TOOLS)
    include(serdi.cmake)
endif()

# TODO: Documentation and tests