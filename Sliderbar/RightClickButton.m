//
//  RightClickButton.m
//  Sliderbar
//
//  Created by Michael Feldstein on 8/2/14.
//  Copyright (c) 2014 Macromeez. All rights reserved.
//

#import "RightClickButton.h"

@implementation RightClickButton

-(id)target{
    target = [super target]; // Lets NSButton do it’s thing
    return target;
}

- (void)setTarget:(id)newTarget{
    target = newTarget;
}
- (void)setRightAction:(SEL)aSelector{
    rightButtonAction = aSelector;
}

-(void)rightMouseDown:(NSEvent *)theEvent{
    [target performSelector:rightButtonAction withObject:theEvent];
}

@end
