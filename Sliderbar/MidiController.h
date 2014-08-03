//
//  MidiController.h
//  Sliderbar
//
//  Created by Michael Feldstein on 8/2/14.
//  Copyright (c) 2014 Macromeez. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <VVMidi/VVMidi.h>
@interface MidiController : NSObject {
    VVMIDIManager *_midiManager;
}
@property IBOutlet NSTextField* channelField;
- (IBAction)sliderChange:(NSSlider*)sender;
- (IBAction)buttonPress:(NSButton*)sender;
@end
