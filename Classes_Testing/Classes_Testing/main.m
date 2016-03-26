//
//  main.m
//  Classes_Testing
//
//  Created by 铮 罗 on 6/21/12.
//  Copyright (c) 2012 四川大学. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Person *person = nil;
        person = [[Person alloc] init];
        [person setName:@"Zheng Luo"];
        [person setAge:20];
        
        [person castBallot];
        
       // [person release];
    }
    return 0;
}

