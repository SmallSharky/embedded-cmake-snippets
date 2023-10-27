

set(triple arm-none-eabi)

find_program(CLANG clang REQUIRED)
find_program(CLANGXX clang++ REQUIRED)
find_program(ARM_NONE_EABI_GCC ${ARM_NONE_EABI_PREFIX}-gcc${TOOLCHAIN_EXT} REQUIRED)
find_program(ARM_NONE_EABI_LD ${ARM_NONE_EABI_PREFIX}-ld${TOOLCHAIN_EXT} REQUIRED)

set(CMAKE_C_COMPILER ${CLANG})
set(CMAKE_C_COMPILER_TARGET ${triple})
set(CMAKE_CXX_COMPILER ${CLANG})
set(CMAKE_CXX_COMPILER_TARGET ${triple})

include_directories(${ARM_NONE_EABI_INC_DIR})
