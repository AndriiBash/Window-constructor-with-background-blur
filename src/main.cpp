//-------------------------------------------------------------------------------------------
//
//  Project Window-constructor-with-background-blur
//  Copyright © 2023. All Rights Reserved.
//
//  OS:           macOS 13.4 (Ventura)
//  FILE:         main.cpp
//  AUTHOR:       Andrii Izbash
//
//  Project link: https://github.com/AndriyPetrovic/Window-constructor-with-background-blur
//-------------------------------------------------------------------------------------------


#include <QApplication>
#include <blurWidget.h>
#include <mainwindow.h>

// stub code
#ifndef __APPLE__
Widget::Widget() : QWidget(nullptr) {}
void Widget::moveEvent(QMoveEvent *event) { QWidget::moveEvent(event); }
void Widget::resizeEvent(QResizeEvent *event) { QWidget::resizeEvent(event); }
#endif

int main(int argc, char **argv)
{
    QApplication app(argc, argv);

    BlurWidget blurWindow;
    blurWindow.layout()->setContentsMargins(0, 0, 0, 0);
    blurWindow.setMinimumSize(450, 200);
    blurWindow.show();

    return app.exec();
}
