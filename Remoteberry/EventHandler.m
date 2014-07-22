//
//  EventHandler.m
//  Remoteberry
//
//  Created by osx on 22.07.14.
//
//

#import "EventHandler.h"
#import "NetworkCommunication.h"

@implementation EventHandler

+(Boolean)HandleEvent:(NSString*)event fromCommunication:(NetworkCommunication*)com{
    if (!event||[event length]<2) {
        return false;
    }

    NSArray* splittedEvent= [event componentsSeparatedByString:@":"];

    
    if ([[splittedEvent objectAtIndex:0] isEqualToValue:(int)0]) {
        return false;
    }
    
    NSLog(@"Nachricht empfangen");
    NSLog(@"Typ:%@",[splittedEvent objectAtIndex:1]);
    return true;
}

@end
