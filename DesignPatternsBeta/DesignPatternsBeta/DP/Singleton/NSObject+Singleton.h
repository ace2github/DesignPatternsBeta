//
//  NSObject+Singleton.h
//  UIImageView-PlayGIF
//
//  Created by ChaohuiChen on 6/1/16.
//  Copyright © 2016 yangfei.me. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  所有的类都具有自动单例能力~~~
 */
@interface NSObject (Singleton)
/**
 *  获取类的单例方法，不用手动自己去实现单例
 *
 *  @return 返回单例对象
 */
+ (instancetype)singleton;

/**
 *  清空当前类的单例~~~
 */
+ (void)clearSingleton;

/**
 *  情况所有的单例
 */
+ (void)clearAllSingletons;

/**
 *  获取所有的单例
 *
 *  @return dic
 */
+ (NSDictionary *)fetchAllSingletons;
@end
