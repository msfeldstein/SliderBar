//
//  MidiController.m
//  Sliderbar
//
//  Created by Michael Feldstein on 8/2/14.
//  Copyright (c) 2014 Macromeez. All rights reserved.
//

#import "MidiController.h"

@implementation MidiController

- (void)awakeFromNib {
    _midiManager = [[VVMIDIManager alloc] init];
}
- (IBAction)sliderChange:(NSSlider*)sender {
    //NSLog(@"AppController:ctrlValSliderUsed:");
    VVMIDIMessage		*msg = nil;
    
    //	create a message
    msg = [VVMIDIMessage createFromVals:
                 VVMIDIControlChangeVal:
           4:
           sender.tag:
           floor(127*[sender floatValue])];
    
    /*
     NSArray		*tmpArray = [NSArray arrayWithObjects:[NSNumber numberWithUnsignedChar:0x7F],[NSNumber numberWithUnsignedChar:0x7E],nil];
     msg = [VVMIDIMessage createWithSysexArray:tmpArray];
     */
    //	tell the midi manager to send it
    if (msg != nil)
        [_midiManager sendMsg:msg];
}

- (IBAction)buttonPress:(NSButton*)sender {
    //NSLog(@"AppController:ctrlValSliderUsed:");
    VVMIDIMessage		*msg = nil;
    
    //	create a message
    msg = [VVMIDIMessage createFromVals:
                 VVMIDIControlChangeVal:
           4:
           sender.tag:
           floor(127*[sender floatValue])];
    
    /*
     NSArray		*tmpArray = [NSArray arrayWithObjects:[NSNumber numberWithUnsignedChar:0x7F],[NSNumber numberWithUnsignedChar:0x7E],nil];
     msg = [VVMIDIMessage createWithSysexArray:tmpArray];
     */
    //	tell the midi manager to send it
    if (msg != nil)
        [_midiManager sendMsg:msg];
}

@end
