

#---------------------------------------------------------------------------------------
# Set compilers
#---------------------------------------------------------------------------------------

find_program(ARM_NONE_EABI_GCC ${ARM_NONE_EABI_PREFIX}-gcc${TOOLCHAIN_EXT} REQUIRED)
find_program(ARM_NONE_EABI_GXX ${ARM_NONE_EABI_PREFIX}-g++${TOOLCHAIN_EXT} REQUIRED)

set(CMAKE_C_COMPILER ${ARM_NONE_EABI_GCC})
set(CMAKE_CXX_COMPILER ${ARM_NONE_EABI_GXX})
set(CMAKE_ASM_COMPILER ${ARM_NONE_EABI_GCC})
set(CMAKE_LINKER ${ARM_NONE_EABI_GCC})







add_compile_options(
    $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-use-cxa-atexit>
)