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
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        NSDictionary* values = [defaults objectForKey:@"Channels"];
        if (values) {
            NSEnumerator* enumerator = [values keyEnumerator];
            NSString* key;
            while (key = [enumerator nextObject]) {
                NSNumber* value = [values objectForKey:key];
                NSInteger tag = [key integerValue];
                NSTextField* field = [self.window.contentView viewWithTag:tag];
                [field setIntegerValue:value.integerValue];
                NSLog(@"Set field %@ to %@", field, value);
            }
        }
        
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
    [self.window endEditingFor:nil];
    NSArray* fields = [self textFieldsInView:self.window.contentView];
    NSMutableDictionary* values = [NSMutableDictionary dictionary];
    for (NSTextField* field in fields) {
        [field resignFirstResponder];
        [field setEnabled:![field isEnabled]];
        [field setBezeled:![field isBezeled]];
        [values setObject:[NSNumber numberWithLong:field.integerValue] forKey:[NSString stringWithFormat:@"%li", (long)field.tag]];
    }
    [self save:values];
}

- (NSArray*)textFieldsInView:(NSView*)view {
    NSMutableArray* fields = [NSMutableArray array];
    if ([view class] == [NSTextField class]) {
        [fields addObject:view];
    } else {
        for (NSView* subview in view.subviews) {
            NSArray* subfields = [self textFieldsInView:subview];
            [fields addObjectsFromArray:subfields];
        }
    }
    return fields;

}

- (void) save:(NSDictionary*)values {
    NSLog(@"Save %@", values);
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:values forKey:@"Channels"];
}
@end
