# ****************************************************************************
#  Project:  LibCMaker_litehtml
#  Purpose:  A CMake build script for litehtml library
#  Author:   NikitaFeodonit, nfeodonit@yandex.com
# ****************************************************************************
#    Copyright (c) 2017-2020 NikitaFeodonit
#
#    This file is part of the LibCMaker_litehtml project.
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

# Testing with Google Test.
if(BUILD_TESTING)
  cmr_common_test_part()


  #-----------------------------------------------------------------------
  # Test sources
  #-----------------------------------------------------------------------

  target_sources(${test_NAME}
    PRIVATE
      # ${example_src_DIR}/containers/test/container_test.cpp
      # ${example_src_DIR}/test/contextTest.cpp
      # ${example_src_DIR}/test/cssTest.cpp
      # ${example_src_DIR}/test/documentTest.cpp
      # ${example_src_DIR}/test/layoutGlobalTest.cpp
      # ${example_src_DIR}/test/mediaQueryTest.cpp
      # ${example_src_DIR}/test/webColorTest.cpp
      ${test_src_DIR}/example_test.cpp
  )
  # target_include_directories(${test_NAME} PRIVATE ${example_src_DIR})

  target_include_directories(${test_NAME}
    PRIVATE
      ${test_src_DIR}
  )

  # litehtml
  target_link_libraries(${test_NAME} PRIVATE
    litehtml
  )

  # Skia
  target_link_libraries(${test_NAME} PRIVATE
    Skia::skshaper Skia::skunicode_icu Skia::skunicode Skia::skia
  )

  # Dawn
  if(skia_use_dawn AND skia_use_system_dawn)
    target_link_libraries(${test_NAME} PRIVATE
      dawn::webgpu_dawn
    )
  endif()

  # ICU
  if(skia_use_icu)
    target_compile_definitions(${test_NAME} PRIVATE
      SKIA_USE_ICU
    )

    if(skia_use_system_icu)
      target_link_libraries(${test_NAME} PRIVATE
        ICU::io ICU::i18n ICU::uc ICU::data
      )
    endif()
  endif()
endif()
