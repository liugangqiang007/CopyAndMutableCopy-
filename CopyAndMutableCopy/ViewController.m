//
//  ViewController.m
//  CopyAndMutableCopy
//
//  Created by LGQ on 16/2/15.
//  Copyright © 2016年 LGQ. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self aggregateDeepCopy];
}


- (void)nonAggregateImmutableObject {
    /**
     *  非集合不可变对象的copy, mutableCopy
     */
    NSString *string = @"string";
    
    NSString        *stringCopy        = [string copy]; // 浅拷贝,指针复制
    NSMutableString *mutablestringCopy = [string mutableCopy]; // 深拷贝,内容复制
    
    NSLog(@"\nstring : %p\nstringCopy : %p\nmutablestringCopy : %p", string, stringCopy, mutablestringCopy);
}

- (void)nonAggregateMutableObject {
    /**
     *  非集合可变对象的copy, mutableCopy
     */
    NSMutableString *mutablestring = [NSMutableString stringWithString:@"string"];
    
    NSString        *stringCopy        = [mutablestring copy]; // 深拷贝,内容复制
    NSMutableString *mutablestringCopy = [mutablestring mutableCopy]; // 深拷贝,内容复制
    
    NSLog(@"\nmutablestring : %p\nstringCopy : %p\nmutablestringCopy : %p", mutablestring, stringCopy, mutablestringCopy);
}

- (void)aggregateImmutableObject {
    /**
     *  集合不可变对象的copy, mutableCopy
     */
    NSArray *array = @[@1, @2, @3, @4];
    
    NSArray        *arrayCopy        = [array copy];        //浅拷贝,指针复制
    NSMutableArray *mutableArrayCopy = [array mutableCopy]; //单层深拷贝,内容复制,内部元素仍然是指针复制
    
    NSLog(@"\narray : %p\narrayCopy : %p\nmutableArrayCopy : %p", array, arrayCopy, mutableArrayCopy);
    NSLog(@"\n%p\n%p\n%p",array.firstObject, arrayCopy.firstObject, mutableArrayCopy.firstObject);
    
}

- (void)aggregateMutableObject {
    /**
     *  集合可变对象的copy, mutableCopy
     */
    NSMutableArray *mutablearray = [NSMutableArray arrayWithArray:@[@1, @2, @3, @4]];
    
    //单层深拷贝,内容复制,内部元素仍然是指针复制
    NSArray        *arrayCopy        = [mutablearray copy];
    
    //单层深拷贝,内容复制,内部元素仍然是指针复制
    NSMutableArray *mutableArrayCopy = [mutablearray mutableCopy];
    
    NSLog(@"\nmutablearray : %p\narrayCopy : %p\nmutableArrayCopy : %p", mutablearray, arrayCopy, mutableArrayCopy);
    NSLog(@"\n%p\n%p\n%p",mutablearray.firstObject, arrayCopy.firstObject, mutableArrayCopy.firstObject);
    
}

- (void)aggregateDeepCopy {
    /**
     *  集合的深层拷贝可以使用对应的深拷贝init方法,例如
     *  - (instancetype)initWithArray:(NSArray<ObjectType> *)array copyItems:(BOOL)flag;
     *  集合内部的元素拷贝同样遵从 基本的拷贝原则
     */
    Dog *dog = [Dog dogWithName:@"tom"];

    NSArray *arrayA = [NSArray arrayWithObjects:[NSMutableString stringWithString:@"1"], dog, @"111", nil];
    NSArray *arrayB = [[NSArray alloc] initWithArray:arrayA copyItems:YES];
    
    NSMutableString *mutableStrA = arrayA[0];
    NSMutableString *mutableStrB = arrayB[0];
    
    Dog *dogA = arrayA[1];
    dogA.name = @"wangwang";
    
    Dog *dogB = arrayB[1];
    
    NSString *strA = arrayA[2];
    NSString *strB = arrayB[2];
    
    // 可变对象,内容拷贝
    NSLog(@"\nmutableStrA===>%p\nmutableStrB===>%p", mutableStrA, mutableStrB);
    NSLog(@"\n%@\n%@", dogA, dogB);
    NSLog(@"\ndogA===>%@\ndogB===>%@", dogA.name, dogB.name);
    
    // 不可变对象,指针拷贝
    NSLog(@"\nstrA===>%p\nStrB===>%p", strA, strB);
    
}


@end
