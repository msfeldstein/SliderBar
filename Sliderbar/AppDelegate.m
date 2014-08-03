//
//  AppDelegate.m
//  Sliderbar
//
//  Created by Michael Feldstein on 8/2/14.
//  Copyright (c) 2014 Macromeez. All rights reserved.
//

#import "AppDelegate.h"
#import "RightClickButton.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSStatusBar* statusBar = [NSStatusBar systemStatusBar];
    _statusItem = [statusBar statusItemWithLength:NSVariableStatusItemLength];
    NSImage* image = [NSImage imageNamed:@"StatusIcon"];
    NSRect f = NSMakeRect(0, 0, image.size.width + 10, image.size.height);
    _rightClickButton = [[RightClickButton alloc] initWithFrame:f];
    [_rightClickButton setRightAction:@selector(showMenu:)];
    _rightClickButton.bordered = NO;
    _rightClickButton.image = image;
    [_statusItem setView:_rightClickButton];
    [_rightClickButton setTarget:self];
    [_rightClickButton setAction:@selector(openWindow:)];
}

- (void)openWindow:(NSButton*)button {
    if ([_popupViewController.window isVisible]) {
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

- (void)showMenu:(NSEvent*)e {
    [NSMenu popUpContextMenu:self.rightMenu withEvent:e forView:_rightClickButton];
}

- (IBAction)quit:(id)sender {
    [NSApp terminate:self];
}

@end
