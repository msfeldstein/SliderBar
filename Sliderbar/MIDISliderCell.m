//
//  MIDISliderCell.m
//  Sliderbar
//
//  Created by Michael Feldstein on 8/3/14.
//  Copyright (c) 2014 Macromeez. All rights reserved.
//

#import "MIDISliderCell.h"

@interface MIDISliderCell () {
    float _value;
}

@end

@implementation MIDISliderCell

- (void)setFloatValue:(float)aFloat {
    _value = aFloat;
}

- (float)floatValue {
    return _value;
}

- (void)drawInteriorWithFrame:(NSRect)cellFrame inView:(NSView *)controlView {
    [NSGraphicsContext saveGraphicsState];
    [[NSColor colorWithWhite:216.0 / 255.0 alpha:1.0] set];
    NSRectFill(cellFrame);

    CGRect activeRect = cellFrame;
    activeRect.size.width = cellFrame.size.width * self.floatValue;
    [[NSColor colorWithWhite:129.0 / 255.0 alpha:1.0] set];
    NSRectFill(activeRect);
    NSShadow* shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [NSColor colorWithWhite:0 alpha:255.0];
    shadow.shadowBlurRadius = 5;
    shadow.shadowOffset = NSZeroSize;
    [shadow set];
    NSBezierPath* path = [NSBezierPath bezierPathWithRect:cellFrame];
    [[NSColor whiteColor] set];
    [path setClip];
    [path stroke];
    [NSGraphicsContext restoreGraphicsState];
}

@end
