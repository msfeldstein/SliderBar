//
//  PopupViewController.m
//  Sliderbar
//
//  Created by Michael Feldstein on 8/2/14.
//  Copyright (c) 2014 Macromeez. All rights reserved.
//

#import "PopupViewController.h"

@interface PopupViewController ()

@end

@implementation PopupViewController

- (instancetype)initWithWindowNibName:(NSString *)windowNibName
{
    self = [super initWithWindowNibName:windowNibName];
    if (self) {
    }
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
}

- (void)windowDidResignKey:(NSNotification *)notification {
    [self.window close];
}

- (IBAction)toggleEditMode:(id)sender {
    [self enableAllTextFieldsInView:self.window.contentView];
}

- (void)enableAllTextFieldsInView:(NSView*)view {
    NSArray *subviews = [view subviews];
    for (NSView *view in subviews) {
        if ([view class] == [NSTextField class]) {
            NSTextField* field = (NSTextField*)view;
            [field setEnabled:![field isEnabled]];
            [field setBezeled:![field isBezeled]];
        } else {
            [self enableAllTextFieldsInView:view];
        }
    }
}
@end
