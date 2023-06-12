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

    //MainWindow window;
    //window.show();

    BlurWidget blurWindow;
    blurWindow.layout()->setContentsMargins(0,0,0,0);
    //blurWindow.layout()->setSpacing(0);
    blurWindow.resize(300,300);
    blurWindow.show();


    /*MainWindow window;
    window.resize(300, 300);
    window.show(); */

    return app.exec();
}
