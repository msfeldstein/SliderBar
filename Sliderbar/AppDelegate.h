//
//  AppDelegate.h
//  Sliderbar
//
//  Created by Michael Feldstein on 8/2/14.
//  Copyright (c) 2014 Macromeez. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PopupViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSStatusItem* _statusItem;
    PopupViewController* _popupViewController;
}

@property (assign) IBOutlet NSWindow *window;


@end
