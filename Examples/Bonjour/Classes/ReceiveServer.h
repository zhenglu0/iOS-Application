//
//  ReceiveServer.h
//  Bonjour
//
//  Created by CS193P on 3/2/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ReceiveServer : NSObject <UIActionSheetDelegate> {

    NSNetService *              netService;
    CFSocketRef                 _listeningSocket;
    
    NSInputStream *             _networkStream;
    NSOutputStream *            _fileStream;
    NSString *                  _filePath;
}

@property (nonatomic, readonly) BOOL                isStarted;
@property (nonatomic, readonly) BOOL                isReceiving;
@property (nonatomic, retain)   NSNetService *      netService;
@property (nonatomic, assign)   CFSocketRef         listeningSocket;
@property (nonatomic, retain)   NSInputStream *     networkStream;

@end
