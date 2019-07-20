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

# Create the given directory
# param directory : The directory to create
function(CREATE_DIRECTORY directory)
    FILE(MAKE_DIRECTORY ${directory})
    MESSAGE(STATUS "Created : ${directory}")
endfunction()

# Check the architecture(32 or 64 bits)
# param architecture : Will contains 32 or 64
function(CHECK_ARCHITECTURE architecture)
    # 64 bits compiler
    if(CMAKE_SIZEOF_VOID_P EQUAL 8)
        SET(${architecture} 64 PARENT_SCOPE)
    # 32 bits compiler
    elseif(CMAKE_SIZEOF_VOID_P EQUAL 4)
        SET(${architecture} 32 PARENT_SCOPE)
    endif()
endfunction()