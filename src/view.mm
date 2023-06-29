//-------------------------------------------------------------------------------------------
//
//  Project Window-constructor-with-background-blur
//  Copyright © 2023. All Rights Reserved.
//
//  OS:           macOS 13.4 (Ventura)
//  FILE:         wiem.mm
//  AUTHOR:       Andrii Izbash
//
//  Project link: https://github.com/AndriyPetrovic/Window-constructor-with-background-blur
//-------------------------------------------------------------------------------------------


#include "BlurWidget.h"
#include <mainwindow.h>

#import <AppKit/AppKit.h>

BlurWidget::BlurWidget() : QWidget()
{
    winId();
    setAttribute(Qt::WA_TranslucentBackground);

    // native window dragging, smoother than handling mouseMoveEvent
    NSView* view = (NSView*)window()->effectiveWinId();
    NSWindow* wnd = [view window];
    [wnd setMovableByWindowBackground:YES];

    // set color for title bar
    wnd.titlebarAppearsTransparent = YES;
    wnd.backgroundColor = [NSColor colorWithRed:12. green:132. blue:2. alpha:1.];

    // set title name
    [wnd setTitle:@"Blur-Behind-Mac"];

    // setup the native vibrancy effect
    auto v = [[[NSVisualEffectView alloc] init] autorelease];
    v.material = NSVisualEffectMaterialHUDWindow;
    v.blendingMode = NSVisualEffectBlendingModeBehindWindow;
    v.state = NSVisualEffectStateActive;

    [wnd.contentView addSubview:v];
    [v setFrameSize:[ [ wnd contentView ] frame ].size];

    effectsView = v;

    // interface make
    QWidget* content = new QWidget(this);
    content->setContentsMargins(0, 0, 0, 0);
    content->move(0, 0);

    MainWindow* leftMenuWindow = new MainWindow(this);

    QVBoxLayout* layout = new QVBoxLayout(content);
    layout->addWidget(leftMenuWindow);
    layout->setContentsMargins(0, 0, 0, 0);

    QVBoxLayout* mainLayout = new QVBoxLayout(this);
    mainLayout->addWidget(content);
    mainLayout->setContentsMargins(0, 0, 0, 0);

    NSView* contentView = (NSView*)content->winId();
    [wnd.contentView addSubview:contentView];

    //content->show();
}


void BlurWidget::moveEvent(QMoveEvent *event)
{
    QWidget::moveEvent(event);
    NSView* view = (NSView*)window()->effectiveWinId();
    NSWindow* wnd = [view window];
    NSView* effect = (NSView*)effectsView;
    [effect setFrame:[ [ wnd contentView ] frame ]];
}


void BlurWidget::resizeEvent(QResizeEvent *event)
{
    QWidget::resizeEvent(event);
    NSView* view = (NSView*)window()->effectiveWinId();
    NSWindow* wnd = [view window];
    NSView* effect = (NSView*)effectsView;
    [effect setFrame:[ [ wnd contentView ] frame ]];
}


