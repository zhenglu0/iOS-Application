//
//  ReceiveServer.m
//  Bonjour
//
//  Created by CS193P on 3/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ReceiveServer.h"

#include <CFNetwork/CFNetwork.h>

#include <sys/socket.h>
#include <netinet/in.h>


@interface ReceiveServer (Private)
- (void)_startServer;
- (void)_stopServer:(NSString *)reason;
@end

@implementation ReceiveServer

- (id)init
{
	if (self = [super init])
	{
		[self _startServer];
	}
	
	return self;
}

- (void)dealloc
{
	[self _stopServer:@"Shutting Down"];

	[super dealloc];
}


#pragma mark
#pragma mark Server
// These methods are used by the core transfer code to update the UI.

- (void)_didReceiveData:(NSData *)data
{
	NSString	*string = [NSKeyedUnarchiver unarchiveObjectWithData:data];
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:string delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	;
}

- (void)_serverDidStartOnPort:(int)port
{
}

- (void)_serverDidStopWithReason:(NSString *)reason
{
}

- (void)_receiveDidStart
{
}

- (void)_updateStatus:(NSString *)statusString
{
}

- (void)_receiveDidStopWithStatus:(NSString *)statusString
{
}

@synthesize netService;
@synthesize networkStream   = _networkStream;
@synthesize listeningSocket = _listeningSocket;

- (BOOL)isStarted
{
    return (self.netService != nil);
}

- (BOOL)isReceiving
{
    return (self.networkStream != nil);
}

// Have to write our own setter for listeningSocket because CF gets grumpy 
// if you message NULL.

- (void)setListeningSocket:(CFSocketRef)newValue
{
    if (newValue != self->_listeningSocket) {
        if (self->_listeningSocket != NULL) {
            CFRelease(self->_listeningSocket);
        }
        self->_listeningSocket = newValue;
        if (self->_listeningSocket != NULL) {
            CFRetain(self->_listeningSocket);
        }
    }
}

- (void)_startReceive:(int)fd
{
    CFReadStreamRef     readStream;
    
    assert(fd >= 0);
	
    assert(self.networkStream == nil);      // can't already be receiving
	
    // Open a stream based on the existing socket file descriptor.  Then configure 
    // the stream for async operation.
	
    CFStreamCreatePairWithSocket(NULL, fd, &readStream, NULL);
    assert(readStream != NULL);
    
    self.networkStream = (NSInputStream *) readStream;
    
    CFRelease(readStream);
	
    [self.networkStream setProperty:(id)kCFBooleanTrue forKey:(NSString *)kCFStreamPropertyShouldCloseNativeSocket];
	
    self.networkStream.delegate = self;
    [self.networkStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [self.networkStream open];
	
    // Tell the UI we're receiving.
    
    [self _receiveDidStart];
}

- (void)_stopReceiveWithStatus:(NSString *)statusString
{
    if (self.networkStream != nil) {
        self.networkStream.delegate = nil;
        [self.networkStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
        [self.networkStream close];
        self.networkStream = nil;
    }
    [self _receiveDidStopWithStatus:statusString];
}

- (void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode
// An NSStream delegate callback that's called when events happen on our 
// network stream.
{
#pragma unused(aStream)
    assert(aStream == self.networkStream);
	
    switch (eventCode) {
        case NSStreamEventOpenCompleted: {
            [self _updateStatus:@"Opened connection"];
        } break;
        case NSStreamEventHasBytesAvailable: {
            NSInteger       bytesRead;
            uint8_t         buffer[32768];
			
            [self _updateStatus:@"Receiving"];
			
            // Pull some data off the network.
            
            bytesRead = [self.networkStream read:buffer maxLength:sizeof(buffer)];
            if (bytesRead == -1) {
                [self _stopReceiveWithStatus:@"Network read error"];
            } else if (bytesRead == 0) {
                [self _stopReceiveWithStatus:nil];
            } else {
				// FIXME: Popup an alert
				NSData	*data = [NSData dataWithBytes:buffer length:bytesRead];
				[self _didReceiveData:data];
            }
        } break;
        case NSStreamEventHasSpaceAvailable: {
            assert(NO);     // should never happen for the output stream
        } break;
        case NSStreamEventErrorOccurred: {
            [self _stopReceiveWithStatus:@"Stream open error"];
        } break;
        case NSStreamEventEndEncountered: {
            // ignore
        } break;
        default: {
            assert(NO);
        } break;
    }
}

- (void)_acceptConnection:(int)fd
{
    int     junk;
	
    // If we already have a connection, reject this new one.  This is one of the 
    // big simplifying assumptions in this code.  A real server should handle 
    // multiple simultaneous connections.
	
    if ( self.isReceiving ) {
        junk = close(fd);
        assert(junk == 0);
    } else {
        [self _startReceive:fd];
    }
}

static void AcceptCallback(CFSocketRef s, CFSocketCallBackType type, CFDataRef address, const void *data, void *info)
// Called by CFSocket when someone connects to our listening socket.  
// This implementation just bounces the request up to Objective-C.
{
    ReceiveServer *  obj;
    
#pragma unused(type)
    assert(type == kCFSocketAcceptCallBack);
#pragma unused(address)
    // assert(address == NULL);
    assert(data != NULL);
    
    obj = (ReceiveServer *) info;
    assert(obj != nil);
	
#pragma unused(s)
    assert(s == obj->_listeningSocket);
    
    [obj _acceptConnection:*(int *)data];
}

- (void)netService:(NSNetService *)sender didNotPublish:(NSDictionary *)errorDict
// A NSNetService delegate callback that's called if our Bonjour registration 
// fails.  We respond by shutting down the server.
//
// This is another of the big simplifying assumptions in this sample. 
// A real server would use the real name of the device for registrations, 
// and handle automatically renaming the service on conflicts.  A real 
// client would allow the user to browse for services.  To simplify things 
// we just hard-wire the service name in the client and, in the server, fail 
// if there's a service name conflict.
{
#pragma unused(sender)
    assert(sender == self.netService);
#pragma unused(errorDict)
    
    [self _stopServer:@"Registration failed"];
}

- (void)_startServer
{
    BOOL        success;
    int         err;
    int         fd;
    int         junk;
    struct sockaddr_in addr;
    int         port;
    
    // Create a listening socket and use CFSocket to integrate it into our 
    // runloop.  We bind to port 0, which causes the kernel to give us 
    // any free port, then use getsockname to find out what port number we 
    // actually got.
	
    port = 0;
    
    fd = socket(AF_INET, SOCK_STREAM, 0);
    success = (fd != -1);
    
    if (success) {
        memset(&addr, 0, sizeof(addr));
        addr.sin_len    = sizeof(addr);
        addr.sin_family = AF_INET;
        addr.sin_port   = 0;
        addr.sin_addr.s_addr = INADDR_ANY;
        err = bind(fd, (const struct sockaddr *) &addr, sizeof(addr));
        success = (err == 0);
    }
    if (success) {
        err = listen(fd, 5);
        success = (err == 0);
    }
    if (success) {
        socklen_t   addrLen;
		
        addrLen = sizeof(addr);
        err = getsockname(fd, (struct sockaddr *) &addr, &addrLen);
        success = (err == 0);
        
        if (success) {
            assert(addrLen == sizeof(addr));
            port = ntohs(addr.sin_port);
        }
    }
    if (success) {
        CFSocketContext context = { 0, self, NULL, NULL, NULL };
        
        self.listeningSocket = CFSocketCreateWithNative(
														NULL, 
														fd, 
														kCFSocketAcceptCallBack, 
														AcceptCallback, 
														&context
														);
        success = (self.listeningSocket != NULL);
        
        if (success) {
            CFRunLoopSourceRef  rls;
            
            CFRelease(self.listeningSocket);        // to balance the create
			
            fd = -1;        // listeningSocket is now responsible for closing fd
			
            rls = CFSocketCreateRunLoopSource(NULL, self.listeningSocket, 0);
            assert(rls != NULL);
            
            CFRunLoopAddSource(CFRunLoopGetCurrent(), rls, kCFRunLoopDefaultMode);
            
            CFRelease(rls);
        }
    }
	
    // Now register our service with Bonjour.  See the comments in -netService:didNotPublish: 
    // for more info about this simplifying assumption.
	
    if (success) {
        self.netService = [[[NSNetService alloc] initWithDomain:@"local." type:@"_sampleservice._tcp." name:[UIDevice currentDevice].name port:port] autorelease];
        success = (self.netService != nil);
    }
    if (success) {
        self.netService.delegate = self;
        
        [self.netService publishWithOptions:NSNetServiceNoAutoRename];
        
        // continues in -netServiceDidPublish: or -netService:didNotPublish: ...
    }
    
    // Clean up after failure.
    
    if ( success ) {
        assert(port != 0);
        [self _serverDidStartOnPort:port];
    } else {
        [self _stopServer:@"Start failed"];
        if (fd != -1) {
            junk = close(fd);
            assert(junk == 0);
        }
    }
}

- (void)_stopServer:(NSString *)reason
{
    if (self.isReceiving) {
        [self _stopReceiveWithStatus:@"Cancelled"];
    }
    if (self.netService != nil) {
        [self.netService stop];
        self.netService = nil;
    }
    if (self.listeningSocket != NULL) {
        CFSocketInvalidate(self.listeningSocket);
        self.listeningSocket = NULL;
    }
    [self _serverDidStopWithReason:reason];
}

@end
