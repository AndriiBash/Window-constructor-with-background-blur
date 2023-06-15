//-------------------------------------------------------------------------------------------
//
//  Project Window-constructor-with-background-blur
//  Copyright © 2023. All Rights Reserved.
//
//  OS:           macOS 13.4 (Ventura)
//  FILE:         mainwindow.h
//  AUTHOR:       Andrii Izbash
//
//  Project link: https://github.com/AndriyPetrovic/Window-constructor-with-background-blur
//-------------------------------------------------------------------------------------------


#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

#include "blurWidget.h"

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_pushButton_clicked();

private:
    Ui::MainWindow *ui;
};

#endif // MAINWINDOW_H
