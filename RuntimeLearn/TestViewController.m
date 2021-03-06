//
//  ViewController.m
//  RuntimeLearn
//
//  Created by Metallic  on 17/3/15.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "TestViewController.h"
#import "NSObject+RLProperty.h"
#import <objc/runtime.h>
#import "RLAutoDictionary.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //给分类添加属性
//    NSObject *object = [[NSObject alloc] init];
//    object.test = @"123";
//    NSLog(@"%@", object.test);
    
    //交换方法实现
//    [self method1];
//    [self method2];
//    
//    [self exchangeMethods];
//    
//    [self method1];
//    [self method2];
//    
//    [self exchangeMethods];
//    
//    [self method1];
//    [self method2];
    
    //消息转发之动态方法解析
    RLAutoDictionary *autoDictionary = [[RLAutoDictionary alloc] init];
    autoDictionary.string = @"动态方法解析";
    autoDictionary.number = @1;
    autoDictionary.date = [NSDate date];
    NSLog(@"%@, %@, %@", autoDictionary.string, autoDictionary.number, autoDictionary.date);
}

- (void)exchangeMethods
{
    Method method1 = class_getInstanceMethod([self class], @selector(method1));
    Method method2 = class_getInstanceMethod([self class], @selector(method2));
    method_exchangeImplementations(method1, method2);
}

- (void)method1
{
    NSLog(@"method1!");
}

- (void)method2
{
    NSLog(@"method2!");
}


@end
