#include "BlurWidget.h"
#include <mainwindow.h>

#import <AppKit/AppKit.h>

BlurWidget::BlurWidget() : QWidget()
{
    winId();
    setAttribute(Qt::WA_TranslucentBackground);

    // native window dragging, smoother than handling mouseMoveEvent
    NSView *view = (NSView *)window()->effectiveWinId();
    NSWindow *wnd = [view window];
    [wnd setMovableByWindowBackground:YES];

    // setup the native vibrancy effect
    auto v = [[[NSVisualEffectView alloc] init] autorelease];
    v.material = NSVisualEffectMaterialHUDWindow;
    v.blendingMode = NSVisualEffectBlendingModeBehindWindow;
    v.state = NSVisualEffectStateActive;

    [wnd.contentView addSubview:v];
    [v setFrameSize:[ [ wnd contentView ] frame ].size];

    effectsView = v;

    // interface make
    setWindowTitle("Gradify");

    QWidget* content = new QWidget(this);
    content->setContentsMargins(0, 0, 0, 0);
    content->move(0, 0);

    MainWindow *leftMenuWindow = new MainWindow(this);

    QVBoxLayout* layout = new QVBoxLayout(content);
    layout->addWidget(leftMenuWindow);
    layout->setContentsMargins(0, 0, 0, 0);

    QVBoxLayout* mainLayout = new QVBoxLayout(this);
    mainLayout->addWidget(content);
    mainLayout->setContentsMargins(0, 0, 0, 0);


    NSView *contentView = (NSView *)content->winId();
    [wnd.contentView addSubview:contentView];

    content->show();

}


void BlurWidget::moveEvent(QMoveEvent *event)
{
    QWidget::moveEvent(event);
    NSView *view = (NSView *)window()->effectiveWinId();
    NSWindow *wnd = [view window];
    NSView* effect = (NSView*)effectsView;
    [effect setFrame:[ [ wnd contentView ] frame ]];
}


void BlurWidget::resizeEvent(QResizeEvent *event)
{
    QWidget::resizeEvent(event);
    NSView *view = (NSView *)window()->effectiveWinId();
    NSWindow *wnd = [view window];
    NSView* effect = (NSView*)effectsView;
    [effect setFrame:[ [ wnd contentView ] frame ]];
}


