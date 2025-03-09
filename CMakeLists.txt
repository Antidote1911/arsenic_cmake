cmake_minimum_required(VERSION 3.15)

project(cpp_project)

# Optionally set c++ standard for all targets
#set(CMAKE_CXX_STANDARD 20)


add_subdirectory(src)

## Flags (Release is the default)
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()
