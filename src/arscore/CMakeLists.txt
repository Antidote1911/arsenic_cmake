cmake_minimum_required(VERSION 3.16)

project(arscore LANGUAGES CXX)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


find_package(Qt6 6.5 REQUIRED COMPONENTS Core Widgets)


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
