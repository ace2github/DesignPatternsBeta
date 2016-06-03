//
//  Person.m
//  UIImageView-PlayGIF
//
//  Created by ChaohuiChen on 6/1/16.
//  Copyright © 2016 yangfei.me. All rights reserved.
//

#import "Person.h"

@implementation Person
//+ (instancetype)singleton {
//    static Person *_sharedManager = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _sharedManager = [[[self class] alloc] init];
//    });
//    
//    return _sharedManager;
//}

- (void)dealloc{
    NSLog(@"Dealloc %@",[self class]);
}
@end

@implementation Student
//+ (instancetype)singleton {
//    static Student *_sharedManager = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        _sharedManager = [[[self class] alloc] init];
//    });
//    
//    return _sharedManager;
//}
- (void)dealloc{
    NSLog(@"Dealloc %@",[self class]);
}
@end


/////////////////////////////////////////////
//
//
//
/////////////////////////////////////////////
@implementation ObjectA
- (id)init {
    if (self = [super init]) {
        [Student singleton];
    }
    return self;
}
@end

@implementation ObjectB
- (id)init {
    if (self = [super init]) {
        [ObjectA singleton];
    }
    return self;
}
@end

@implementation ObjectC
- (id)init {
    if (self = [super init]) {
        [ObjectC singleton];
    }
    return self;
}
@end










