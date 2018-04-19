//
//  Dog.h
//  CopyAndMutableCopy
//
//  Created by LGQ on 16/2/15.
//  Copyright © 2016年 LGQ. All rights reserved.
//

#import <Foundation/Foundation.h>

// 可拷贝对象
@interface Dog : NSObject <NSCopying>

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithName:(NSString *)name;
+ (instancetype)dogWithName:(NSString *)name;

@end
