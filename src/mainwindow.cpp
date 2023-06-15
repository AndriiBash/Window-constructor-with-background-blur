//-------------------------------------------------------------------------------------------
//
//  Project Window-constructor-with-background-blur
//  Copyright © 2023. All Rights Reserved.
//
//  OS:           macOS 13.4 (Ventura)
//  FILE:         mainwindow.cpp
//  AUTHOR:       Andrii Izbash
//
//  Project link: https://github.com/AndriyPetrovic/Window-constructor-with-background-blur
//-------------------------------------------------------------------------------------------


#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QMessageBox>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    this->layout()->setContentsMargins(0, 0, 0, 0);
    this->layout()->setSpacing(0);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    QMessageBox::information(this,"fd","hello!");
}

