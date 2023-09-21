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

SUBMODULE (LIBHEFE) VIEWPORT
        USE, NON_INTRINSIC :: LIBHEFE, ONLY: ESCAPE_CLEAR_1
IMPLICIT NONE
CONTAINS
    IMPURE SUBROUTINE CLEAR_SCREEN_FULL
        USE, NON_INTRINSIC :: LIBHEFE, ONLY: ESCAPE_CLEAR_2
    IMPLICIT NONE
        INTRINSIC :: ACHAR

        CALL CLEAR_SCREEN_PARTIALLY
        PRINT '(A)', ACHAR (27) // ESCAPE_CLEAR_2
    END SUBROUTINE CLEAR_SCREEN_FULL

    IMPURE SUBROUTINE CLEAR_SCREEN_PARTIALLY
    IMPLICIT NONE
        INTRINSIC :: ACHAR

        PRINT '(A)', ACHAR (27) // ESCAPE_CLEAR_1
    END SUBROUTINE CLEAR_SCREEN_PARTIALLY
END SUBMODULE VIEWPORT

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
