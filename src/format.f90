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
    USE, NON_INTRINSIC :: LIBHEFE, ONLY: INIT_TEXT
    USE, NON_INTRINSIC :: LIBHEFE, ONLY: RESET     => ESCAPE_RESET
    USE, NON_INTRINSIC :: LIBHEFE, ONLY: RESIZE
IMPLICIT NONE
CONTAINS
    PURE SUBROUTINE BOLD_TEXT_RESET (TEXT)
        USE, NON_INTRINSIC :: LIBHEFE, ONLY: BOLD => ESCAPE_BOLD
    IMPLICIT NONE
        CHARACTER (:), ALLOCATABLE                 :: BUFFER
        CHARACTER (:), INTENT (INOUT), ALLOCATABLE :: TEXT
        INTRINSIC                                  :: ACHAR
        INTRINSIC                                  :: LEN

        CALL INIT_TEXT (TEXT, BUFFER)
        CALL RESIZE (TEXT, LEN (BOLD) + LEN (BUFFER) + LEN (RESET) + 2)
        TEXT = ACHAR (27) // BOLD // BUFFER // ACHAR (27) // RESET
        DEALLOCATE (BUFFER)
    END SUBROUTINE BOLD_TEXT_RESET

    PURE SUBROUTINE CURSOR_TEXT (TEXT, X, Y)
        USE, NON_INTRINSIC :: LIBHEFE, ONLY: STRINGIFY
    IMPLICIT NONE
        CHARACTER (:), ALLOCATABLE                 :: BUFFER
        CHARACTER (:), ALLOCATABLE                 :: X_BUFFER
        CHARACTER (:), ALLOCATABLE                 :: Y_BUFFER
        CHARACTER (:), INTENT (INOUT), ALLOCATABLE :: TEXT
        INTEGER                                    :: X_VALUE
        INTEGER                                    :: Y_VALUE
        INTEGER, INTENT (IN)                       :: X
        INTEGER, INTENT (IN)                       :: Y
        INTRINSIC                                  :: ACHAR
        INTRINSIC                                  :: LEN

        CALL INIT_TEXT (TEXT, BUFFER)
        CALL INIT_TEXT ('', X_BUFFER)
        CALL INIT_TEXT ('', Y_BUFFER)
        X_VALUE = X
        Y_VALUE = Y

        IF (X_VALUE <= 0) THEN
            X_VALUE = 1
        END IF

        IF (Y_VALUE <= 0) THEN
            Y_VALUE = 1
        END IF

        CALL STRINGIFY (X_VALUE, X_BUFFER)
        CALL STRINGIFY (Y_VALUE, Y_BUFFER)
        CALL RESIZE (TEXT, LEN (Y_BUFFER) + LEN (X_BUFFER) + LEN (BUFFER) + 4)
        TEXT = ACHAR (27) // '[' // Y_BUFFER // ';' // X_BUFFER // 'H' // BUFFER
        DEALLOCATE (BUFFER)
        DEALLOCATE (X_BUFFER)
        DEALLOCATE (Y_BUFFER)
    END SUBROUTINE CURSOR_TEXT
END SUBMODULE FORMAT

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
