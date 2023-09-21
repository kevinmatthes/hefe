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

SUBMODULE (LIBHEFE) MEMORY
    USE, NON_INTRINSIC :: LIBHEFE, ONLY: RESIZE
IMPLICIT NONE
CONTAINS
    PURE SUBROUTINE DISCARD_SURROUNDING_WHITESPACES (TEXT)
    IMPLICIT NONE
        CHARACTER (:), ALLOCATABLE                 :: BUFFER
        CHARACTER (:), INTENT (INOUT), ALLOCATABLE :: TEXT
        INTRINSIC                                  :: ADJUSTL
        INTRINSIC                                  :: LEN
        INTRINSIC                                  :: LEN_TRIM
        INTRINSIC                                  :: TRIM

        TEXT = ADJUSTL (TEXT)
        ALLOCATE (CHARACTER (LEN_TRIM (TEXT)) :: BUFFER)
        BUFFER = TRIM (TEXT)
        CALL RESIZE (TEXT, LEN (BUFFER))
        TEXT = BUFFER
        DEALLOCATE (BUFFER)
    END SUBROUTINE DISCARD_SURROUNDING_WHITESPACES

    PURE SUBROUTINE INIT_TEXT (MESSAGE, TEXT)
    IMPLICIT NONE
        CHARACTER (*), INTENT (IN)               :: MESSAGE
        CHARACTER (:), INTENT (OUT), ALLOCATABLE :: TEXT
        INTRINSIC                                :: LEN

        CALL RESIZE (TEXT, LEN (MESSAGE))
        TEXT = MESSAGE
    END SUBROUTINE INIT_TEXT

    PURE SUBROUTINE RESIZE_CHARACTER (TEXT, NUM)
    IMPLICIT NONE
        CHARACTER (:), INTENT (INOUT), ALLOCATABLE :: TEXT
        INTEGER, INTENT (IN)                       :: NUM
        INTRINSIC                                  :: ALLOCATED

        IF (ALLOCATED (TEXT)) THEN
            DEALLOCATE (TEXT)
        END IF

        IF (NUM > 0) THEN
            ALLOCATE (CHARACTER (NUM) :: TEXT)
        END IF
    END SUBROUTINE RESIZE_CHARACTER

    PURE SUBROUTINE STRINGIFY_INTEGER (NUM, TEXT)
        USE, NON_INTRINSIC :: LIBHEFE, ONLY: DISCARD_SURROUNDING_WHITESPACES
    IMPLICIT NONE
        CHARACTER (:), INTENT (OUT), ALLOCATABLE :: TEXT
        INTEGER, INTENT (IN)                     :: NUM
        INTRINSIC                                :: ADJUSTL
        INTRINSIC                                :: INT
        INTRINSIC                                :: LOG10
        INTRINSIC                                :: REAL
        INTRINSIC                                :: TRIM

        IF (INT (LOG10 (REAL (NUM))) + 1 > 80) THEN
            CALL RESIZE (TEXT, 1)
            TEXT = '*'
        ELSE
            CALL RESIZE (TEXT, 80)
            WRITE (TEXT, '(I80)') NUM
            CALL DISCARD_SURROUNDING_WHITESPACES (TEXT)
        END IF
    END SUBROUTINE STRINGIFY_INTEGER
END SUBMODULE MEMORY

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
