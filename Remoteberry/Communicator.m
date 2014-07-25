//
//  NetworkCommunication.m
//  Remoteberry
//
//  Created by osx on 21.07.14.
//
//

#import "Communicator.h"
#import "EventHandler.h"

@interface Communicator ()
{
    NSInputStream *inputStream;
    NSOutputStream *outputStream;
}
@end


@implementation Communicator
-(void)connectToHost{
    NSString *address = [[NSUserDefaults standardUserDefaults] objectForKey:@"defaultAddress"];
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (__bridge CFStringRef)address, 51396, &readStream, &writeStream);
    inputStream = (__bridge NSInputStream*)readStream;
    outputStream = (__bridge NSOutputStream*)writeStream;
    
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    
    [inputStream scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [inputStream open];
    [outputStream open];
    
    [self greeting];
    
    //CFReadStreamOpen(readStream);
   // CFWriteStreamOpen(writeStream);
}


-(void)greeting{
    NSLog(@"Greeting");
    NSString *response  = [NSString stringWithFormat:@"name:%@", @"iPhone"];
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSUTF8StringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
}

-(void)whoIsAtHome{
    NSLog(@"whoIsAtHome");
    NSString *response  = @"who:";
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSUTF8StringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
}

- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode{

    
    switch (eventCode) {
            
		case NSStreamEventOpenCompleted:
			break;
            
		case NSStreamEventHasBytesAvailable:
            if (aStream == inputStream) {
                uint8_t buffer[1024];
                int len;
                
                while ([inputStream hasBytesAvailable]) {
                    len = [inputStream read:buffer maxLength:sizeof(buffer)];
                    if (len > 0) {
                        
                        NSString *output = [[NSString alloc] initWithBytes:buffer length:len encoding:NSASCIIStringEncoding];
                        
                        if (nil != output) {
                            [EventHandler HandleEvent:output fromCommunication:self];
                        }
                    }
                }
            }
			break;
            
		case NSStreamEventHasSpaceAvailable:
                           break;
            
        case NSStreamEventErrorOccurred:
			NSLog(@"NSStreamEventErrorOccurred");
			break;
            
		case NSStreamEventEndEncountered:
			break;
            
		default:
			NSLog(@"Unknown event");
	}
    
}



@end
