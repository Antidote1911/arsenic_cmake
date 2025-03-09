cmake_minimum_required(VERSION 3.15)

project(cpp_project)

# Optionally set c++ standard for all targets
#set(CMAKE_CXX_STANDARD 20)


set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
# Find Botan early since the version affects subsequent compiler options
find_package(Botan REQUIRED)
if(BOTAN_VERSION VERSION_GREATER_EQUAL "3.0.0")
    set(WITH_XC_BOTAN3 TRUE)
elseif(BOTAN_VERSION VERSION_LESS "2.11.0")
    # Check for minimum Botan version
    message(FATAL_ERROR "Botan 2.11.0 or higher is required")   
endif()
include_directories(SYSTEM ${BOTAN_INCLUDE_DIR})



add_subdirectory(src)

## Flags (Release is the default)
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()
