cmake_minimum_required(VERSION 3.14)

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build, options are: Debug, Release, or MinSizeRel." FORCE)
    message(STATUS "CMAKE_BUILD_TYPE not set, defaulting to Release.")
endif()

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

project(ObjectBoxCRoot
    DESCRIPTION "ObjectBox C and C++"
    VERSION 0.16.0
    LANGUAGES C CXX)

option(BUILD_OPTION_TESTS "Build Test projects" ON)
option(BUILD_OPTION_EXAMPLES "Build Example projects" ON)

include (libraries)

if (BUILD_OPTION_TESTS)
    add_subdirectory(src-test)
    add_subdirectory(src-test-gen)
endif ()

if(BUILD_OPTION_EXAMPLES)
    add_subdirectory(examples)
endif()
