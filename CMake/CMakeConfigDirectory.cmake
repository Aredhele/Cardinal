# Copyright (C) 2018-2019 Ordinal Engine
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

# Getting utils
INCLUDE(${CMAKE_SOURCE_DIR}/CMake/CMakeConfigGlobal.cmake)
INCLUDE(${CMAKE_SOURCE_DIR}/CMake/CMakeConfigFunction.cmake)

MESSAGE(STATUS "Checking project structure.")

IF(NOT EXISTS ${ORDINAL_BIN_DIR})

    MESSAGE(STATUS "Creating binary directory.")

    CREATE_DIRECTORY(${ORDINAL_BIN_DIR})
    CREATE_DIRECTORY(${ORDINAL_BIN_DIR_DBG_32})
    CREATE_DIRECTORY(${ORDINAL_BIN_DIR_REL_32})
    CREATE_DIRECTORY(${ORDINAL_BIN_DIR_DBG_64})
    CREATE_DIRECTORY(${ORDINAL_BIN_DIR_REL_64})
ENDIF()

IF(NOT EXISTS ${ORDINAL_LIB_DIR})

    MESSAGE(STATUS "Creating library directory.")

    CREATE_DIRECTORY(${ORDINAL_LIB_DIR})
    CREATE_DIRECTORY(${ORDINAL_LIB_DIR_DBG_32})
    CREATE_DIRECTORY(${ORDINAL_LIB_DIR_REL_32})
    CREATE_DIRECTORY(${ORDINAL_LIB_DIR_DBG_64})
    CREATE_DIRECTORY(${ORDINAL_LIB_DIR_REL_64})
ENDIF()

MESSAGE(STATUS "Project checked.")