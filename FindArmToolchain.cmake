
# TODO: choose between gcc/clang

set(CMAKE_SYSTEM_NAME  Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

include(./arm-none-eabi-toolchain)
include(./arm-none-eabi-binutils)
if(TOOLCHAIN AND TOOLCHAIN STREQUAL "clang")
include(./arm-none-eabi-clang)
else()
include(./arm-none-eabi-gcc)
endif()

# Perform compiler test with static library
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)


#---------------------------------------------------------------------------------------
# Set compiler/linker flags
#---------------------------------------------------------------------------------------

# Object build options
# -O0                   No optimizations, reduce compilation time and make debugging produce the expected results.
# -mthumb               Generat thumb instructions.
# -fno-builtin          Do not use built-in functions provided by GCC.
# -Wall                 Print only standard warnings, for all use Wextra
# -ffunction-sections   Place each function item into its own section in the output file.
# -fdata-sections       Place each data item into its own section in the output file.
# -fomit-frame-pointer  Omit the frame pointer in functions that don’t need one.
# -mabi=aapcs           Defines enums to be a variable sized type.

add_compile_options(
    -mthumb
    # -Wall
    # -Wextra
    # -Wimplicit-function-declaration
    # -Wredundant-decls
    # -Wstrict-prototypes
    # -Wundef
    # -Wshadow
    -fdata-sections
    -ffunction-sections
    # -fno-builtin
    # -Werror
    $<$<COMPILE_LANGUAGE:Asm>:"-x assembler-with-cpp">
)


add_link_options(
    -mthumb
    -Wl,-Map=${CMAKE_PROJECT_NAME}.map
    -Wl,-gc-sections
    -flto
)

set(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_PREFIX}/${${TOOLCHAIN}} ${CMAKE_PREFIX_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)


