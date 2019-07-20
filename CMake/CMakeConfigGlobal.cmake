# Copyright (C) 2019-2020 Cardinal
# Vincent STEHLY--CALISTO, vincentstehly@hotmail.fr

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# he Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

# Paths
# Engine main paths
SET(ORDINAL_ROOT_DIR            ${CMAKE_SOURCE_DIR})
SET(ORDINAL_BIN_DIR             ${ORDINAL_ROOT_DIR}/Bin)
SET(ORDINAL_LIB_DIR             ${ORDINAL_ROOT_DIR}/Lib)
SET(ORDINAL_ENGINE_DIR          ${ORDINAL_ROOT_DIR}/Engine)
SET(ORDINAL_ENGINE_HEADER_DIR   ${ORDINAL_ENGINE_DIR}/Header)
SET(ORDINAL_ENGINE_SOURCE_DIR   ${ORDINAL_ENGINE_DIR}/Source)
SET(ORDINAL_THIRD_PARTY_DIR     ${ORDINAL_ENGINE_DIR}/ThirdParty)
SET(ORDINAL_ENGINE_RESOURCE_DIR ${ORDINAL_ENGINE_DIR}/Resources)

# Engine binaries paths
# Debug
SET(ORDINAL_BIN_DIR_DBG_32  ${ORDINAL_BIN_DIR}/Debug32)
SET(ORDINAL_LIB_DIR_DBG_32  ${ORDINAL_LIB_DIR}/Debug32)
SET(ORDINAL_BIN_DIR_DBG_64  ${ORDINAL_BIN_DIR}/Debug64)
SET(ORDINAL_LIB_DIR_DBG_64  ${ORDINAL_LIB_DIR}/Debug64)

# Release
SET(ORDINAL_BIN_DIR_REL_32  ${ORDINAL_BIN_DIR}/Release32)
SET(ORDINAL_LIB_DIR_REL_32  ${ORDINAL_LIB_DIR}/Release32)
SET(ORDINAL_BIN_DIR_REL_64  ${ORDINAL_BIN_DIR}/Release64)
SET(ORDINAL_LIB_DIR_REL_64  ${ORDINAL_LIB_DIR}/Release64)

# Names
# Engine runtime names
SET(ORDINAL_RUNTIME_DBG_32 OrdinalRuntimeDebug32)
SET(ORDINAL_RUNTIME_DBG_64 OrdinalRuntimeDebug64)
SET(ORDINAL_RUNTIME_REL_32 OrdinalRuntimeRelease32)
SET(ORDINAL_RUNTIME_REL_64 OrdinalRuntimeRelease64)

# Engine runtime libraries names
SET(ORDINAL_RUNTIME_LIBRARY_DBG_32 OrdinalRuntimeLibraryDebug32)
SET(ORDINAL_RUNTIME_LIBRARY_DBG_64 OrdinalRuntimeLibraryDebug64)
SET(ORDINAL_RUNTIME_LIBRARY_REL_32 OrdinalRuntimeLibraryRelease32)
SET(ORDINAL_RUNTIME_LIBRARY_REL_64 OrdinalRuntimeLibraryRelease64)

# Engine unit test names
SET(ORDINAL_RUNTIME_UNIT_TEST_DBG_32 OrdinalRuntimeUnitTestDebug32)
SET(ORDINAL_RUNTIME_UNIT_TEST_DBG_64 OrdinalRuntimeUnitTestDebug64)
SET(ORDINAL_RUNTIME_UNIT_TEST_REL_32 OrdinalRuntimeUnitTestRelease32)
SET(ORDINAL_RUNTIME_UNIT_TEST_REL_64 OrdinalRuntimeUnitTestRelease64)