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
aflags     := 'rsv'
app        := 'hefe'
ar         := 'ar'
cflags-app := '-fPIE'
cflags-lib := '-c -fPIC'
cflags     := '-std=f2018 -Wall -Werror -Wextra -Wpedantic'
cc         := 'gfortran'
lflags     := '-I. -L. -lhefe'
lib        := 'libhefe.a'
litter     := '*.mod *.smod'
o          := '*.o'
rflags     := '-rfv'
rm         := 'rm'

# Compile the executable.
build:
    just compile libhefe.f90
    just compile format.f90
    just executable hefe.f90

# Compile a single library source file.
compile f:
    {{ cc }} {{ cflags-lib }} {{ cflags }} {{ f }}
    {{ ar }} {{ aflags }} {{ lib }} {{ o }}
    {{ rm }} {{ rflags }} {{ o }}

# Compile the executable.
executable f:
    {{ cc }} {{ cflags-app }} {{ cflags }} {{ f }} -o {{ app }} {{ lflags }}
    {{ rm }} {{ rflags }} {{ lib }} {{ litter }}

################################################################################
