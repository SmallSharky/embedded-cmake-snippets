#---------------------------------------------------------------------------------------
# Set toolchain paths
#---------------------------------------------------------------------------------------
set(ARM_NONE_EABI arm-none-eabi)

if(NOT DEFINED TOOLCHAIN_PREFIX)
    if(CMAKE_HOST_SYSTEM_NAME STREQUAL Linux)
        set(TOOLCHAIN_PREFIX "/usr")
    elseif(CMAKE_HOST_SYSTEM_NAME STREQUAL Darwin)
        set(TOOLCHAIN_PREFIX "/usr/local")
    elseif(CMAKE_HOST_SYSTEM_NAME STREQUAL Windows)
        message(STATUS "Please specify the TOOLCHAIN_PREFIX !\n For example: -DTOOLCHAIN_PREFIX=\"C:/Program Files/GNU Tools ARM Embedded\" ")
    else()
        set(TOOLCHAIN_PREFIX "/usr")
        message(STATUS "No TOOLCHAIN_PREFIX specified, using default: " ${TOOLCHAIN_PREFIX})
    endif()
endif()
set(ARM_NONE_EABI_LOCATION ${TOOLCHAIN_PREFIX})
set(ARM_NONE_EABI_BIN_DIR ${ARM_NONE_EABI_LOCATION}/bin)
set(ARM_NONE_EABI_INC_DIR ${ARM_NONE_EABI_LOCATION}/${ARM_NONE_EABI}/include)
set(ARM_NONE_EABI_LIB_DIR ${ARM_NONE_EABI_LOCATION}/${ARM_NONE_EABI}/lib)

# Set system depended extensions
if(WIN32)
    set(TOOLCHAIN_EXT ".exe" )
else()
    set(TOOLCHAIN_EXT "" )
endif()

set(ARM_NONE_EABI_PREFIX ${ARM_NONE_EABI_BIN_DIR}/${ARM_NONE_EABI})