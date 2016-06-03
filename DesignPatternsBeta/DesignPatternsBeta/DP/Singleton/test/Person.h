//
//  Person.h
//  UIImageView-PlayGIF
//
//  Created by ChaohuiChen on 6/1/16.
//  Copyright © 2016 yangfei.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Singleton.h"

@interface Person : NSObject
@property (nonatomic, strong) NSString *name;
@end

@interface Student : Person
//@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *grade;
@end




/////////////////////////////////////////////
//
//
//
/////////////////////////////////////////////
@interface ObjectA : NSObject
@end



@interface ObjectB : NSObject
@end



@interface ObjectC : NSObject
@end
