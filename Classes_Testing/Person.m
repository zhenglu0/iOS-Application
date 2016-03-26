//
//  Person.m
//  Classes_Testing
//
//  Created by 铮 罗 on 6/21/12.
//  Copyright (c) 2012 四川大学. All rights reserved.
//

#import "Person.h"

@implementation Person
/*
-(NSString *)name {
    return name;
} 

-(void)setName:(NSString *)value {
    name = value;
}

-(int)age {
    return age; 
}

-(void)setAge:(int)value {
    age = value; 
}
*/

@synthesize name;
@synthesize age;


-(void)setAge:(int)value {
    age = value; 
    NSLog(@"The age has been set");
}

-(BOOL)canLegallyVote{
    if (age > 17) {
        return YES;
    } else {
        return NO;
    }
}

-(void)castBallot{
    if([self canLegallyVote]){
        NSLog(@"I have voted for ZL");
    } else {
        NSLog(@"I am not allowed to vote!");
    }
}
@end
