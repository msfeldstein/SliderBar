//
//  MIDISliderView.m
//  Sliderbar
//
//  Created by Michael Feldstein on 8/3/14.
//  Copyright (c) 2014 Macromeez. All rights reserved.
//

#import "MIDISliderView.h"
#import "MIDISliderCell.h"
@implementation MIDISliderView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.floatValue = 0.5;
    }
    return self;
}

- (void)mouseDown:(NSEvent *)theEvent {
    [self mouseEvent:theEvent];
}

- (void)mouseDragged:(NSEvent *)theEvent{
    [self mouseEvent:theEvent];
}
- (void)mouseEvent:(NSEvent*)theEvent {
    NSPoint p = theEvent.locationInWindow;
    NSPoint inView = [self convertPoint:p fromView:nil];
    self.floatValue = inView.x / self.bounds.size.width;
    [self setNeedsDisplay];
}


+ (Class)cellClass {
    return [MIDISliderCell class];
}


@end
