#-------------------------------------------------
#
# Project created by QtCreator 2023-05-14T19:06:21
#
#-------------------------------------------------

CONFIG += c++17

QT     += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = Gradify
TEMPLATE = app

DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += main.cpp \
    mainwindow.cpp

macos {
    SOURCES += view.mm
}

HEADERS += \
    blurWidget.h \
    mainwindow.h

FORMS += \
    mainwindow.ui
