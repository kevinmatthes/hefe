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

MODULE LIBHEFE
IMPLICIT NONE
PRIVATE
    CHARACTER (*), PARAMETER, PUBLIC :: ESCAPE_BOLD  = '[1m'
    CHARACTER (*), PARAMETER, PUBLIC :: ESCAPE_RESET = '[0m'

    PUBLIC :: BOLD_TEXT_RESET
    INTERFACE
        PURE MODULE SUBROUTINE BOLD_TEXT_RESET (TEXT)
        IMPLICIT NONE
            CHARACTER (:), INTENT (INOUT), ALLOCATABLE :: TEXT
        END SUBROUTINE BOLD_TEXT_RESET
    END INTERFACE

    PUBLIC :: INIT_TEXT
    INTERFACE
      PURE MODULE SUBROUTINE INIT_TEXT (MESSAGE, TEXT)
      IMPLICIT NONE
          CHARACTER (*), INTENT (IN)               :: MESSAGE
          CHARACTER (:), INTENT (OUT), ALLOCATABLE :: TEXT
      END SUBROUTINE INIT_TEXT
    END INTERFACE
END MODULE LIBHEFE

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
