//
//  AppDelegate.m
//  Sliderbar
//
//  Created by Michael Feldstein on 8/2/14.
//  Copyright (c) 2014 Macromeez. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSStatusBar* statusBar = [NSStatusBar systemStatusBar];
    _statusItem = [statusBar statusItemWithLength:NSVariableStatusItemLength];
    NSImage* image = [NSImage imageNamed:@"StatusIcon"];
    NSRect f = NSMakeRect(0, 0, image.size.width + 10, image.size.height);
    NSButton* sliderButton = [[NSButton alloc] initWithFrame:f];
    sliderButton.bordered = NO;
    sliderButton.image = image;
    [_statusItem setView:sliderButton];
    [sliderButton setTarget:self];
    [sliderButton setAction:@selector(openWindow:)];
//    [_statusItem setLength:image.size.width];
    NSLog(@"Yeah");
}

- (void)openWindow:(NSButton*)button {
    if (_popupViewController.window.visible) {
        [_popupViewController.window close];
        return;
    }
    if (!_popupViewController) {
         _popupViewController = [[PopupViewController alloc] initWithWindowNibName:@"PopupViewController"] ;
    }
//    NSLog(@"Sender %@", sender);
   
    NSWindow* window = _popupViewController.window;
    NSRect windowFrame = window.frame;
    windowFrame.origin = button.frame.origin;
    CGRect eventFrame = [[[NSApp currentEvent] window] frame];
    CGPoint eventOrigin = eventFrame.origin;
    [window setFrameOrigin:eventOrigin];
    [window makeKeyAndOrderFront:self];
    [window orderFrontRegardless];
}

@end
