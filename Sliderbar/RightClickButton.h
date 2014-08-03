//
//  RightClickButton.h
//  Sliderbar
//
//  Created by Michael Feldstein on 8/2/14.
//  Copyright (c) 2014 Macromeez. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RightClickButton : NSButton {
    SEL rightButtonAction;
    id target;
}
- (void)setTarget:(id)target;
- (id)target;
- (void)setRightAction:(SEL)aSelector;
@end
