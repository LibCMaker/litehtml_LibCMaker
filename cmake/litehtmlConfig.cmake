# ****************************************************************************
#  Project:  LibCMaker
#  Purpose:  A CMake build scripts for build libraries with CMake
#  Author:   NikitaFeodonit, nfeodonit@yandex.com
# ****************************************************************************
#    Copyright (c) 2017-2026 NikitaFeodonit
#
#    This file is part of the LibCMaker project.
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published
#    by the Free Software Foundation, either version 3 of the License,
#    or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#    See the GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program. If not, see <http://www.gnu.org/licenses/>.
# ****************************************************************************


#-----------------------------------------------------------------------
# Library version
#

set(litehtml_VERSION "0.10.20261102" CACHE STRING "litehtml_VERSION")
set(litehtml_sha256
  "3232b8c6f2cb8c60ecea166d953e424a599bc8b78c262e5e64d2f4890e5bde2c"
  CACHE STRING "litehtml_sha256"
)


#-----------------------------------------------------------------------
# litehtml options
#-----------------------------------------------------------------------

option(LITEHTML_ENABLE_LINT "enable linting for litehtml" OFF)


#-----------------------------------------------------------------------
# Unpack, configure and build the required libraries
#-----------------------------------------------------------------------

# find_package(Git 2.17.1 REQUIRED)

set(litehtml_SRC_NAME "litehtml-${litehtml_VERSION}")
set(litehtml_ARCHIVE_DIR "${CMAKE_CURRENT_LIST_DIR}/source")
set(litehtml_PATCH_DIR "${litehtml_ARCHIVE_DIR}/patch/${litehtml_SRC_NAME}")


include(FetchContent)

FetchContent_Declare(
  litehtml
  URL "${CMAKE_CURRENT_LIST_DIR}/source/${litehtml_SRC_NAME}.tar.xz"
  URL_HASH SHA256=${litehtml_sha256}
  OVERRIDE_FIND_PACKAGE
  # PATCH_COMMAND
  #   ${GIT_EXECUTABLE} apply
  #     "${litehtml_PATCH_DIR}/CMake_various_fixes.patch"
)

FetchContent_MakeAvailable(litehtml)
