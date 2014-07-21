//
//  NetworkCommunication.m
//  Remoteberry
//
//  Created by osx on 21.07.14.
//
//

#import "NetworkCommunication.h"

@implementation NetworkCommunication

-(void)connectToHost{
    NSString *address = [[NSUserDefaults standardUserDefaults] objectForKey:@"defaultAddress"];
    NSLog(@"connect to host: %@",address);

    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (__bridge CFStringRef)address, 51396, &readStream, &writeStream);
    inputStream = (__bridge NSInputStream *)readStream;
    outputStream = (__bridge NSOutputStream *)writeStream;
}

@end
