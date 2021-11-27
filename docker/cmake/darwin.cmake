set(CMAKE_SYSTEM_NAME Darwin)

set(CMAKE_C_FLAGS_INIT "-fvisibility=hidden -fvisibility-inlines-hidden")
set(CMAKE_CXX_FLAGS_INIT "-fvisibility=hidden -fvisibility-inlines-hidden")

set(CMAKE_C_COMPILER $ENV{CROSS_TRIPLE}-clang)
set(CMAKE_CXX_COMPILER $ENV{CROSS_TRIPLE}-clang++)
set(CMAKE_AR $ENV{CROSS_TRIPLE}-ar)
set(CMAKE_RANLIB $ENV{CROSS_TRIPLE}-ranlib)
set(CMAKE_INSTALL_NAME_TOOL $ENV{CROSS_TRIPLE}-install_name_tool)
set(CMAKE_NM $ENV{CROSS_TRIPLE}-nm)

# target environment on the build host system
set(CMAKE_FIND_ROOT_PATH $ENV{CROSS_ROOT})

# search for programs in the build host directories
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
