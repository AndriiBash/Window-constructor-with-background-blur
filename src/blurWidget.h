//-------------------------------------------------------------------------------------------
//
//  Project Window-constructor-with-background-blur
//  Copyright © 2023. All Rights Reserved.
//
//  OS:           macOS 13.4 (Ventura)
//  FILE:         blurWidget.h
//  AUTHOR:       Andrii Izbash
//
//  Project link: https://github.com/AndriyPetrovic/Window-constructor-with-background-blur
//-------------------------------------------------------------------------------------------


#ifndef WIDGET_H
#define WIDGET_H

#include <QtWidgets>
#include <QWindow>
#include <QResizeEvent>

class BlurWidget : public QWidget
{

public:
    BlurWidget();
    ~BlurWidget() = default;

    void moveEvent(QMoveEvent *event) override;
    void resizeEvent(QResizeEvent *event) override;

private:
    void* effectsView = nullptr;
};



#endif // WIDGET_H
