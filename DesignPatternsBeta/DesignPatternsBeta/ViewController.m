//
//  ViewController.m
//  DesignPatternsBeta
//
//  Created by ChaohuiChen on 6/1/16.
//  Copyright © 2016 ChaohuiChen. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self testSingleton];
}

- (void)testSingleton {
    NSLog(@"%@",[NSObject fetchAllSingletons]);
    [Person singleton].name = @"Person :: hello world";
    [Student singleton].name = @"Student :: hello world";
    [Student singleton].grade = @"小一班";
    NSLog(@"%@",[NSObject fetchAllSingletons]);
    [NSObject clearAllSingletons];
    NSLog(@"%@",[NSObject fetchAllSingletons]);
    
    [Person singleton].name = @"Person :: hello world";
    [Student singleton].name = @"Student :: hello world";
    [Student singleton].grade = @"小一班";
    NSLog(@"%@,%@",[Person singleton],[Person singleton].name);
    NSLog(@"%@,%@,%@",[Student singleton],[Student singleton].name,[Student singleton].grade);

    for (int i=0; i<1000; i++) {
        NSLog(@"%@ %@",[Student singleton].name,[Student singleton].grade);
        NSLog(@"%@",[Person singleton].name);
        NSLog(@"%p,%p,%p",[Person singleton].name,[Student singleton].name,[Student singleton].grade);
    }
    [Person clearSingleton];
    [Person singleton].name = @"New Person %d :: hello world";
    
    dispatch_async(dispatch_get_global_queue(0, DISPATCH_QUEUE_PRIORITY_DEFAULT), ^{
        for (int i=1000; i<2000; i++) {
            NSLog(@"%@ %@",[Student singleton].name,[Student singleton].grade);
            NSLog(@"%@",[Person singleton].name);
            NSLog(@"%p,%p,%p",[Person singleton].name,[Student singleton].name,[Student singleton].grade);
        }
        [Student clearSingleton];
        [Student singleton].name = @"New Student :: hello world";
        
        dispatch_async(dispatch_get_main_queue(), ^{
            for (int i=3000; i<4000; i++) {
                NSLog(@"%@ %@",[Student singleton].name,[Student singleton].grade);
                NSLog(@"%@",[Person singleton].name);
                NSLog(@"%p,%p,%p",[Person singleton].name,[Student singleton].name,[Student singleton].grade);
            }
            
        });
    });
    
    dispatch_async(dispatch_get_global_queue(0, DISPATCH_QUEUE_PRIORITY_DEFAULT), ^{
        for (int i=2000; i<3000; i++) {
            NSLog(@"%@ %@",[Student singleton].name,[Student singleton].grade);
            NSLog(@"%@",[Person singleton].name);
            NSLog(@"%p,%p,%p",[Person singleton].name,[Student singleton].name,[Student singleton].grade);
        }
        
    });

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
