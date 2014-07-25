//
//  EventHandler.h
//  Remoteberry
//
//  Created by osx on 22.07.14.
//
//

#import <Foundation/Foundation.h>
#import "Communicator.h"

@interface EventHandler : NSObject

+(Boolean)HandleEvent:(NSString*)event fromCommunication:(Communicator*)com;

@end
