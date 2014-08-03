//
//  AppDelegate.h
//  Sliderbar
//
//  Created by Michael Feldstein on 8/2/14.
//  Copyright (c) 2014 Macromeez. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PopupViewController.h"
#import "RightClickButton.h"
@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSStatusItem* _statusItem;
    PopupViewController* _popupViewController;
    RightClickButton* _rightClickButton;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSMenu *rightMenu;

@end
