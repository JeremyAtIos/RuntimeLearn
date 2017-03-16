//
//  NSObject+RLProperty.m
//  RuntimeLearn
//
//  Created by Metallic  on 17/3/15.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "NSObject+RLProperty.h"
#import <objc/runtime.h>

@implementation NSObject (RLProperty)

- (void)setTest:(NSString *)test
{
    objc_setAssociatedObject(self, @selector(test), test, OBJC_ASSOCIATION_COPY);
}

- (NSString *)test
{
    return objc_getAssociatedObject(self, @selector(test));
}

@end
