######################## GNU General Public License 3.0 ########################
##                                                                            ##
## Copyright (C) 2023 Kevin Matthes                                           ##
##                                                                            ##
## This program is free software: you can redistribute it and/or modify       ##
## it under the terms of the GNU General Public License as published by       ##
## the Free Software Foundation, either version 3 of the License, or          ##
## (at your option) any later version.                                        ##
##                                                                            ##
## This program is distributed in the hope that it will be useful,            ##
## but WITHOUT ANY WARRANTY; without even the implied warranty of             ##
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              ##
## GNU General Public License for more details.                               ##
##                                                                            ##
## You should have received a copy of the GNU General Public License          ##
## along with this program.  If not, see <https://www.gnu.org/licenses/>.     ##
##                                                                            ##
################################################################################

################################################################################
##
##  AUTHOR      Kevin Matthes
##  BRIEF       The recipes in order to compile the provided executable.
##  COPYRIGHT   GPL-3.0
##  DATE        2023
##  FILE        .justfile
##  NOTE        See `LICENSE' for full license.
##              See `README.md' for project details.
##
################################################################################

# Magic numbers.
aflags       := 'rsv'
app          := 'hefe'
ar           := 'ar'
cflags-app   := '-fPIE'
cflags-lib   := '-c -fPIC'
cflags       := '-std=f2018 -Wall -Werror -Wextra -Wpedantic'
cc           := 'gfortran'
lflags       := '-I. -L. -lhefe'
lib          := 'libhefe.a'
litter       := '*.mod *.smod'
o            := '*.o'
rflags       := '-rfv'
rm           := 'rm'
valgrind     := 'valgrind'
vflags-error := '--error-exitcode=42 --redzone-size=1024'
vflags-full  := '--leak-check=full --show-leak-kinds=all'
vflags       := vflags-error + ' ' + vflags-full

# The default recipe to execute.
default:
    just tests

# Build the executable.
build: library
    just executable src/hefe.f90 hefe
    just clean

# Remove cmopilation artifacts.
clean:
    {{ rm }} {{ rflags }} {{ lib }} {{ litter }}

# Compile a single library source file.
compile f:
    {{ cc }} {{ cflags-lib }} {{ cflags }} {{ f }}
    {{ ar }} {{ aflags }} {{ lib }} {{ o }}
    {{ rm }} {{ rflags }} {{ o }}

# Compile the executable.
executable f o:
    {{ cc }} {{ cflags-app }} {{ cflags }} {{ f }} -o {{ o }} {{ lflags }}

# Compile the library.
library:
    just compile src/libhefe.f90
    just compile src/memory.f90
    just compile src/viewport.f90
    just compile src/format.f90

# Compile and run a single test.
test f: library
    just executable {{ f }} test
    just valgrind ./test
    {{ rm }} {{ rflags }} test

# Compile and run all tests.
tests:
    just test tests/stringify_integer.f90

# Check the executable.
valgrind a:
    {{ valgrind }} {{ vflags }} {{ a }}

################################################################################
