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
    USE, NON_INTRINSIC :: LIBHEFE, ONLY: INIT_TEXT
IMPLICIT NONE
CONTAINS
    PURE SUBROUTINE BOLD_TEXT_RESET (TEXT)
        USE, NON_INTRINSIC :: LIBHEFE, ONLY: BOLD => ESCAPE_BOLD
    IMPLICIT NONE
        CHARACTER (:), ALLOCATABLE                 :: BUFFER
        CHARACTER (:), INTENT (INOUT), ALLOCATABLE :: TEXT
        INTEGER                                    :: STRLEN
        INTRINSIC                                  :: ACHAR
        INTRINSIC                                  :: LEN

        CALL INIT_TEXT (TEXT, BUFFER)
        STRLEN = LEN (TEXT) + LEN (BOLD) + LEN (RESET) + 2
        DEALLOCATE (TEXT)
        ALLOCATE (CHARACTER (STRLEN) :: TEXT)
        TEXT = ACHAR (27) // BOLD // BUFFER // ACHAR (27) // RESET
        DEALLOCATE (BUFFER)
    END SUBROUTINE BOLD_TEXT_RESET
END SUBMODULE FORMAT

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
