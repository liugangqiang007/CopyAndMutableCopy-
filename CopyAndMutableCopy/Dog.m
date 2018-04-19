//
//  Dog.m
//  CopyAndMutableCopy
//
//  Created by LGQ on 16/2/15.
//  Copyright © 2016年 LGQ. All rights reserved.
//

#import "Dog.h"

@implementation Dog

+ (instancetype)dogWithName:(NSString *)name {
    
    return [[self alloc] initWithName:name];
}

- (instancetype)initWithName:(NSString *)name {
    
    if (self = [super init]) {
        _name = [name copy];
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone {
    
    Dog *copy = [[[self class] allocWithZone:zone] init];
    copy.name = [_name copy];
    
    return copy;
}

@end
