//
//  Person.h
//  Classes_Testing
//
//  Created by 铮 罗 on 6/21/12.
//  Copyright (c) 2012 四川大学. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    // instance virables
    NSString *name;
    int age; 
}

// method declarations
/*
- (NSString *)name;
- (void)setName:(NSString *)value;
- (int)age;
- (void)setAge:(int)age; 
- (BOOL)canLegallyVote; 
*/

- (void)castBallot;

// property declaration
@property(copy) NSString *name;
@property(nonatomic) int age;
@property (readonly)BOOL canLegallyVote;


@end
