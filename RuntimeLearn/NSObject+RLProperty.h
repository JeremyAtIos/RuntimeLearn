//
//  NSObject+RLProperty.h
//  RuntimeLearn
//
//  Created by Metallic  on 17/3/15.
//  Copyright © 2017年 xiaowei. All rights reserved.
//


/*
 给分类添加属性，利用runtime实现get和set方法，关联属性
 */

#import <Foundation/Foundation.h>

@interface NSObject (RLProperty)

@property (nonatomic, strong) NSString *test;

@end
