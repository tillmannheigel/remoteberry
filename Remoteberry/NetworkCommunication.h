//
//  NetworkCommunication.h
//  Remoteberry
//
//  Created by osx on 21.07.14.
//
//

#import <Foundation/Foundation.h>

@interface NetworkCommunication : NSObject{

NSInputStream *inputStream;
NSOutputStream *outputStream;
    
}

-(void)connectToHost;

@end
