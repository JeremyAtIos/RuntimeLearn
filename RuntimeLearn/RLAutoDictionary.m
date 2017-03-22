//
//  RLAutoDictionary.m
//  RuntimeLearn
//
//  Created by Metallic  on 17/3/22.
//  Copyright © 2017年 xiaowei. All rights reserved.
//

#import "RLAutoDictionary.h"
#import <objc/runtime.h>

@interface RLAutoDictionary ()

@property (nonatomic, strong) NSMutableDictionary *backingStore;

@end

@implementation RLAutoDictionary

@dynamic string, number, date, opaqueObject;

- (instancetype)init
{
    self = [super init];
    if (self) {
        _backingStore = [NSMutableDictionary dictionary];
    }
    return self;
}

//动态方法解析
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSString *selectorString = NSStringFromSelector(sel);
    if ([selectorString hasPrefix:@"set"]) {
        class_addMethod(self,
                        sel,
                        (IMP)autoDictionarySetter,
                        "v@:@");
    } else {
        class_addMethod(self,
                        sel,
                        (IMP)autoDictionaryGetter,
                        "@@:");
    }
    
    return YES;
}

id autoDictionaryGetter(id self, SEL _cmd) {
    RLAutoDictionary *typedSelf = (RLAutoDictionary *)self;
    NSMutableDictionary *backingStore = typedSelf.backingStore;
    
    NSString *key = NSStringFromSelector(_cmd);
    
    return [backingStore objectForKey:key];
}

void autoDictionarySetter(id self, SEL _cmd, id value) {
    RLAutoDictionary *typedself = (RLAutoDictionary *)self;
    NSMutableDictionary *backingStore = typedself.backingStore;
    
    NSString *selectorString = NSStringFromSelector(_cmd);
    NSMutableString *key = [selectorString mutableCopy];
    
    [key deleteCharactersInRange:NSMakeRange(key.length - 1, 1)];
    
    [key deleteCharactersInRange:NSMakeRange(0, 3)];
    
    NSString *lowercaseFirstChar = [[key substringToIndex:1] lowercaseString];
    [key replaceCharactersInRange:NSMakeRange(0, 1)
                       withString:lowercaseFirstChar];
    
    if (value) {
        [backingStore setObject:value forKey:key];
    } else {
        [backingStore removeObjectForKey:key];
    }
}

@end
