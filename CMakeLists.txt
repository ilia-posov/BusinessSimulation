# This file handles building each task as sub-project.
#
# Each task becomes an independent project in which you can experiment.
#
# Tasks are added as separate sub-projects so as compilation errors in
# one task don't affect another task.

cmake_minimum_required(VERSION 3.24)

project(BusinessSimulationCourse)

set(CMAKE_BUILD_TYPE "RelWithDebInfo" CACHE STRING "Build type" FORCE)

set(CMAKE_UNITY_BUILD ON)

include(cmake/catch.cmake)
fetch_catch()

# Add tasks subprojects
include(cmake/utils.cmake)
add_subprojects(${PROJECT_SOURCE_DIR})