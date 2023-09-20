!!!!!!!!!!!!!!!!!!!!!!!! GNU General Public License 3.0 !!!!!!!!!!!!!!!!!!!!!!!!
!!                                                                            !!
!! Copyright (C) 2022 Kevin Matthes                                           !!
!!                                                                            !!
!! This program is free software: you can redistribute it and/or modify       !!
!! it under the terms of the GNU General Public License as published by       !!
!! the Free Software Foundation, either version 3 of the License, or          !!
!! (at your option) any later version.                                        !!
!!                                                                            !!
!! This program is distributed in the hope that it will be useful,            !!
!! but WITHOUT ANY WARRANTY; without even the implied warranty of             !!
!! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              !!
!! GNU General Public License for more details.                               !!
!!                                                                            !!
!! You should have received a copy of the GNU General Public License          !!
!! along with this program.  If not, see <https://www.gnu.org/licenses/>.     !!
!!                                                                            !!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

SUBMODULE (LIBHEFE) FORMAT
    USE, NON_INTRINSIC :: LIBHEFE, ONLY: RESET => ESCAPE_RESET
IMPLICIT NONE
CONTAINS
    PURE SUBROUTINE FORMAT_BOLD (TEXT, FORMATTED)
        USE, NON_INTRINSIC :: LIBHEFE, ONLY: BOLD => ESCAPE_BOLD
    IMPLICIT NONE
        CHARACTER (*), INTENT (IN)  :: TEXT
        CHARACTER (*), INTENT (OUT) :: FORMATTED
        INTRINSIC                   :: ACHAR

        FORMATTED = ACHAR (27) // BOLD // TEXT // ACHAR (27) // RESET
    END SUBROUTINE FORMAT_BOLD
END SUBMODULE FORMAT

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
