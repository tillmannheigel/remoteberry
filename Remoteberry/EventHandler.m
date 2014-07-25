//
//  EventHandler.m
//  Remoteberry
//
//  Created by osx on 22.07.14.
//
//

#import "EventHandler.h"
#import "Communicator.h"

@implementation EventHandler

+(Boolean)HandleEvent:(NSString*)event fromCommunication:(Communicator*)com{
    if (!event) {
        return false;
    }
    
    NSArray* splittedEvent= [event componentsSeparatedByString:@":"];
    
    for (NSString* string in splittedEvent) {
        NSLog(string);
    }

    if ([splittedEvent count]<2) {
        NSLog(@"Fehler:%@",@"Nachricht zu kurz");
        return false;
    }
    
    if ([(NSString*)[splittedEvent objectAtIndex:0] isEqualToString:@"0"]) {
        NSLog(@"Server meldet Fehler:%@",[splittedEvent objectAtIndex:1]);
        return false;
    }
    
    NSLog(@"Nachricht empfangen");
    return [self recognizeType:splittedEvent];
}

+(Boolean)recognizeType:(NSArray*)event{
    NSString *type = [event objectAtIndex:1];
    if ([type isEqual:@"login"]) {
        return [self loginEvent:event];
    } else{
    NSLog(@"Type has not been recognized");
    return false;
    }
}

+(Boolean)loginEvent:(NSArray*)event{
    //if
    //bla...
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"login" object:nil];
    return true;
}



@end
