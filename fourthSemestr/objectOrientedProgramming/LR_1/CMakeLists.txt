cmake_minimum_required(VERSION 3.17)
project(Lab_01)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_PREFIX_PATH "/usr/lib/x86_64-linux-gnu/cmake/Qt5")
set(Qt5Widgets_DIR "/usr/lib/x86_64-linux-gnu/cmake/Qt5Widgets")

find_package(Qt5Widgets REQUIRED)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

include_directories(.)
target_link_libraries(Lab_01 Qt5::Widgets)

add_executable(Lab_01
        cdio.cpp
        cdio.h
        defines.h
        draw.cpp
        draw.h
        main.cpp
        mainwindow.cpp
        mainwindow.h
        object.cpp
        object.h
        operations.cpp
        operations.h
        task_manager.cpp
        task_manager.h)
