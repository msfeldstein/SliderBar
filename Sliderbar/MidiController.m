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
    VVMIDIMessage		*msg = nil;
    NSTextField* label = (NSTextField*)[self.contentView viewWithTag:sender.tag + 100];
    NSInteger sig = label.integerValue;
    msg = [VVMIDIMessage createFromVals:
                 VVMIDIControlChangeVal:
           4:
           sig:
           floor(127*[sender floatValue])];
    if (msg != nil)
        [_midiManager sendMsg:msg];
}

- (IBAction)buttonPress:(NSButton*)sender {
    VVMIDIMessage		*msg = nil;
    NSTextField* label = (NSTextField*)[self.contentView viewWithTag:sender.tag + 100];
    NSInteger sig = label.integerValue;
    msg = [VVMIDIMessage createFromVals:
                 VVMIDIControlChangeVal:
           4:
           sig:
           floor(127*[sender floatValue])];

    if (msg != nil)
        [_midiManager sendMsg:msg];
}

@end
