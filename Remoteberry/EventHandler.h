//
//  EventHandler.h
//  Remoteberry
//
//  Created by osx on 22.07.14.
//
//

#import <Foundation/Foundation.h>
#import "NetworkCommunication.h"

@interface EventHandler : NSObject

+(Boolean)HandleEvent:(NSString*)event fromCommunication:(NetworkCommunication*)com;

@end
