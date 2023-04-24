# SPDX-FileCopyrightText: © 2023 Joe T. Sylve, Ph.D. <joe.sylve@gmail.com>
#
# SPDX-License-Identifier: ISC

include(FetchContent)

FetchContent_Declare(serd-source
  GIT_REPOSITORY https://gitlab.com/drobilla/serd.git
  GIT_TAG        1a8312b6cc119788ea0d3f4e6ebf3a2ae2a3075f # v0.30.16
)

FetchContent_MakeAvailable(serd-source)