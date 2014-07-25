//
//  NetworkCommunication.h
//  Remoteberry
//
//  Created by osx on 21.07.14.
//
//

#import <Foundation/Foundation.h>

@interface Communicator : NSObject <NSStreamDelegate>

-(void)connectToHost;

@end
