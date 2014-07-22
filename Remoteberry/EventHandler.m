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

    
    if ((int)[splittedEvent objectAtIndex:0]==0) {
        return false;
    }
    
    NSLog(@"Nachricht empfangen");
    NSLog(@"Typ:%@",[splittedEvent objectAtIndex:1]);
    return true;
}

@end
