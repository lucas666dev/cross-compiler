set(CMAKE_SYSTEM_NAME Linux)

# cross compilers to use for C and C++
set(CMAKE_C_COMPILER $ENV{CROSS_TRIPLE}-gcc)
set(CMAKE_CXX_COMPILER $ENV{CROSS_TRIPLE}-g++)

# target environment on the build host system
set(CMAKE_FIND_ROOT_PATH  $ENV{CROSS_ROOT})
