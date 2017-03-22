//
//  RLAutoDictionary.h
//  RuntimeLearn
//
//  Created by Metallic  on 17/3/22.
//  Copyright © 2017年 xiaowei. All rights reserved.
//
//  消息转发之动态添加方法

#import <Foundation/Foundation.h>

@interface RLAutoDictionary : NSObject

@property (nonatomic, copy) NSString *string;

@property (nonatomic, strong) NSNumber *number;

@property (nonatomic, strong) NSDate *date;

@property (nonatomic, strong) id opaqueObject;

@end
