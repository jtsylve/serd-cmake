# SPDX-FileCopyrightText: © 2023 Joe T. Sylve, Ph.D. <joe.sylve@gmail.com>
#
# SPDX-License-Identifier: ISC

add_library(serd-config INTERFACE EXCLUDE_FROM_ALL)

target_compile_definitions(serd-config
  INTERFACE
    SERD_INTERNAL
    SERD_VERSION="${PROJECT_VERSION}"
    $<$<NOT:$<BOOL:${SERD_CHECKS}>>:SERD_NO_DEFAULT_CONFIG>
    $<$<BOOL:${UNIX}>:_POSIX_C_SOURCE=200809L>
)

# TODO: How to handle the HAS_* checks?