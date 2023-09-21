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

PROGRAM HEFE
    USE, NON_INTRINSIC :: LIBHEFE, ONLY: BOLD_TEXT_RESET
    USE, NON_INTRINSIC :: LIBHEFE, ONLY: CURSOR_TEXT
    USE, NON_INTRINSIC :: LIBHEFE, ONLY: CLEAR_SCREEN_FULL
    USE, NON_INTRINSIC :: LIBHEFE, ONLY: INIT_TEXT
IMPLICIT NONE
    CHARACTER (:), ALLOCATABLE :: TEXT

    CALL CLEAR_SCREEN_FULL
    CALL INIT_TEXT ('Hello,', TEXT)
    CALL BOLD_TEXT_RESET (TEXT)
    CALL CURSOR_TEXT (TEXT, 3, 3)
    PRINT '(A)', TEXT // ' World!'
    DEALLOCATE (TEXT)
END PROGRAM HEFE

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
