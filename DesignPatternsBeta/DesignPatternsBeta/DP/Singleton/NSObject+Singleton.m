//
//  NSObject+Singleton.m
//  UIImageView-PlayGIF
//
//  Created by ChaohuiChen on 6/1/16.
//  Copyright © 2016 yangfei.me. All rights reserved.
//

#import "NSObject+Singleton.h"
static dispatch_queue_t g_SingletonQueue = NULL;
static dispatch_semaphore_t g_Singleton_Lock = NULL;
static NSMapTable *g_MapTable = nil;
static dispatch_once_t g_OnceToken;

@implementation NSObject (Singleton)
+ (void)load {
    //一开始创建lock和map对象，
    //方便后续接口clearSingleton、clearAllSingletons、fetchAllSingletons等的使用
    [NSObject singleton]; [NSObject clearSingleton];
}


#pragma mark - public
+ (instancetype)singleton {
    dispatch_once(&g_OnceToken, ^{
        g_SingletonQueue = dispatch_queue_create("global.singleton.queue", DISPATCH_QUEUE_SERIAL);
        g_Singleton_Lock = dispatch_semaphore_create(1);
        g_MapTable = [[NSMapTable alloc] initWithKeyOptions:NSPointerFunctionsStrongMemory
                                               valueOptions:NSPointerFunctionsStrongMemory
                                                   capacity:64];
    });
    
    dispatch_semaphore_wait(g_Singleton_Lock, DISPATCH_TIME_FOREVER);
    id singleton = [g_MapTable objectForKey:NSStringFromClass([self class])];
    if (!singleton) {
        //当[self class]类的初始化init过程中，初始化新单例，必定dead lock
        singleton = [[[self class] alloc] init];
        [g_MapTable setObject:singleton forKey:NSStringFromClass([self class])];
    }
    dispatch_semaphore_signal(g_Singleton_Lock);
    
    return singleton;
}

+ (void)clearSingleton {
    dispatch_semaphore_wait(g_Singleton_Lock, DISPATCH_TIME_FOREVER);
    [g_MapTable removeObjectForKey:NSStringFromClass([self class])];
    dispatch_semaphore_signal(g_Singleton_Lock);
}


+ (void)clearAllSingletons {
    dispatch_semaphore_wait(g_Singleton_Lock, DISPATCH_TIME_FOREVER);
    [g_MapTable removeAllObjects];
    dispatch_semaphore_signal(g_Singleton_Lock);
}


+ (NSDictionary *)fetchAllSingletons {
    dispatch_semaphore_wait(g_Singleton_Lock, DISPATCH_TIME_FOREVER);
    NSDictionary *singletons = [g_MapTable dictionaryRepresentation];
    dispatch_semaphore_signal(g_Singleton_Lock);

    return singletons;
}
@end
