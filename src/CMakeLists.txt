project(arsenic LANGUAGES CXX)
message(STATUS "Initiating compile using CMake ${CMAKE_VERSION}")


find_package(Qt6 6 REQUIRED COMPONENTS LinguistTools)
set(CMAKE_AUTORCC ON)
qt_standard_project_setup()
set(CMAKE_CXX_STANDARD 20)


list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/../cmake)
# Find Botan early since the version affects subsequent compiler options
find_package(Botan REQUIRED)
if(BOTAN_VERSION VERSION_GREATER_EQUAL "3.0.0")
    set(WITH_XC_BOTAN3 TRUE)
elseif(BOTAN_VERSION VERSION_LESS "2.11.0")
    # Check for minimum Botan version
    message(FATAL_ERROR "Botan 2.11.0 or higher is required")   
endif()
include_directories(SYSTEM ${BOTAN_INCLUDE_DIR})

set(app_icon_resource_windows "${CMAKE_SOURCE_DIR}/share/windows/icon.rc")

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
    Clipboard.h
    Clipboard.cpp
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
    configDialog.cpp
    hashcheckdialog.cpp
    loghtml.cpp
    main.cpp
    mainwindow.cpp
    passwordGeneratorDialog.cpp
    Translator.cpp
    skin/skin.cpp
    rsc.qrc
    arscore/CryptoThread.h
    arscore/PasswordGenerator.h
    arscore/textcrypto.h
    arscore/triplecryptoengine.h
    arscore/simplecryptoengine.h
    arscore/utils.h
    arscore/consts.h
    arscore/messages.h
    arscore/CryptoThread.cpp
    arscore/PasswordGenerator.cpp
    arscore/textcrypto.cpp
    arscore/triplecryptoengine.cpp
    arscore/simplecryptoengine.cpp
    arscore/utils.cpp
    arscore/consts.cpp
    arscore/messages.cpp
    arscore/dict-src.h
    arscore/zxcvbn.cpp
    arscore/zxcvbn.h
    arscore/PasswordHealth.h
    arscore/PasswordHealth.cpp
    arscore/Random.cpp
    arscore/Random.h
    arscore/Global.h
    ${app_icon_resource_windows}
)

target_link_libraries(arsenic
    PRIVATE
        Qt::Core
        Qt::Widgets
        ${BOTAN_LIBRARIES}
)

if (CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
  # using Visual Studio C++
  target_link_libraries(arsenic PRIVATE advapi32 user32 Ws2_32)
endif()


