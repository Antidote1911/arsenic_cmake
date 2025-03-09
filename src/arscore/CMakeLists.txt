cmake_minimum_required(VERSION 3.16)

project(arscore LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


find_package(Qt6 6.5 REQUIRED COMPONENTS Core Widgets)


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


add_library(arscore SHARED
    CryptoThread.h
    libexport.h
    passwordGenerator.h
    textcrypto.h
    triplecryptoengine.h
    simplecryptoengine.h
    utils.h
    consts.h
    messages.h
    CryptoThread.cpp
    passwordGenerator.cpp
    textcrypto.cpp
    triplecryptoengine.cpp
    simplecryptoengine.cpp
    utils.cpp
    consts.cpp
    messages.cpp
    dict-src.h
    zxcvbn.cpp
    zxcvbn.h
)

target_link_libraries(arscore PRIVATE Qt::Core Qt::Widgets ${BOTAN_LIBRARIES})

target_compile_definitions(arscore PRIVATE ARSCORE_LIBRARY)
