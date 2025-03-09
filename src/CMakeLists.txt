cmake_minimum_required(VERSION 3.19)
project(arsenic LANGUAGES CXX)
message(STATUS "Initiating compile using CMake ${CMAKE_VERSION}")


find_package(Qt6 6.5 REQUIRED COMPONENTS Core Widgets)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_AUTORCC ON)
qt_standard_project_setup()

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

add_executable(arsenic
    WIN32 MACOSX_BUNDLE
    aboutDialog.ui
    argonTests.ui
    configDialog.ui
    hashcheckdialog.ui
    mainwindow.ui
    passwordGeneratorDialog.ui
    Config.h
    Delegate.h
    aboutDialog.h
    argonTests.h
    clipboard.h
    configDialog.h
    hashcheckdialog.h
    loghtml.h
    mainwindow.h
    passwordGeneratorDialog.h
    progressbar.h
    Translator.h
    skin/skin.h
    Config.cpp
    Delegate.cpp
    aboutDialog.cpp
    argonTests.cpp
    clipboard.cpp
    configDialog.cpp
    hashcheckdialog.cpp
    loghtml.cpp
    main.cpp
    mainwindow.cpp
    passwordGeneratorDialog.cpp
    Translator.cpp
    skin/skin.cpp
    rsc.qrc
    dict-src.h
    zxcvbn.cpp
    zxcvbn.h
)

add_subdirectory(arscore)

target_link_libraries(arsenic PRIVATE arscore)

target_link_libraries(arsenic
    PRIVATE
        Qt::Core
        Qt::Widgets
        ${BOTAN_LIBRARIES}
        arscore
)
