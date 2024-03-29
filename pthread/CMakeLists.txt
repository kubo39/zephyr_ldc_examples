# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 3.20.0)
find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})
project(ldc_pthread_hello)

target_sources(app PRIVATE src/main.c)

if(${ARCH} STREQUAL "posix" OR ${ARCH} STREQUAL "x86")
    set(ldc_target i686-unknown-none-newlibeabi)
elseif(${ARCH} STREQUAL "arm")
    if(CONFIG_CPU_CORTEX_M3)
        set(ldc_target thumbv7em-unknown-none-newlibeabi)
    else()
        message(FATAL_ERROR "ARCH ${ARCH} not supported")
    endif()
else()
    message(FATAL_ERROR "ARCH ${ARCH} not supported")
endif()

include(ExternalProject)
set(ldc_src_dir ${CMAKE_CURRENT_SOURCE_DIR})
ExternalProject_Add(
    ldc_project
    PREFIX  ${CMAKE_CURRENT_BINARY_DIR}
    SOURCE_DIR  ${ldc_src_dir}
    BUILD_IN_SOURCE 1
    BUILD_ALWAYS    1
    CONFIGURE_COMMAND   ""
    BUILD_COMMAND
        dub
        build
        -f
        -b debug
        --compiler=$ENV{HOME}/dev/install-ldc/bin/ldc2
        --arch=${ldc_target}
    INSTALL_COMMAND ""
    BUILD_BYPRODUCTS    ${ldc_src_dir}/lib/libpthread_hello.a
)

add_library(ldc_lib STATIC IMPORTED GLOBAL)
add_dependencies(
    ldc_lib
    ldc_project
)
set_target_properties(ldc_lib PROPERTIES IMPORTED_LOCATION ${ldc_src_dir}/lib/libpthread_hello.a)
target_link_libraries(app PUBLIC ldc_lib)
