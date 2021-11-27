set(CMAKE_SYSTEM_NAME Windows)

# cross compilers to use for C, C++ and Fortran
set(CMAKE_C_COMPILER $ENV{CROSS_TRIPLE}-gcc)
set(CMAKE_CXX_COMPILER $ENV{CROSS_TRIPLE}-g++)
set(CMAKE_Fortran_COMPILER $ENV{CROSS_TRIPLE}-gfortran)
set(CMAKE_RC_COMPILER $ENV{CROSS_TRIPLE}-windres)

# target environment on the build host system
set(CMAKE_FIND_ROOT_PATH $ENV{CROSS_ROOT})

# modify default behavior of FIND_XXX() commands
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
