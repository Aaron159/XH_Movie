
//
//  BaseModel.m
//  项目一
//
//  Created by mac51 on 16/5/8.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "BaseModel.h"

//HomeModel *model = [[HomeModel alloc] init];
//
//model.rating = subject[@"rating"];
/*
 1、从字典当中拿到key值 返回一个value（获取所有的key）
 //设置model当中的属性值 setter方法 "setRating:"
 2、将key字符串 转换成 set方法字符串
 3、将set字符串转换成 SEL类型的方法
 4、调用该set方法完成属性值的设置
 */

@implementation BaseModel

-(instancetype)initWithDictionary:(NSDictionary *)dic
{
    if ( self  = [super init]) {
        [self buildRelationship:dic];
    }
    
    return self;
}

- (void)buildRelationship:(NSDictionary *)dic
{
    NSArray *allKeys = [dic allKeys];
    for (NSString *key in allKeys) {
        //将key转换成setkey
        NSString *setKey = [self changeKeyToSetKey:key];
        //将setkey转换成selector
        SEL method = [self changeSetKeyToSelector:setKey];
        
        //拿到key对应的value
        id value = dic[key];
        //调用set方法，完成属性设值
        if ([self respondsToSelector:method]) {
            [self performSelector:method withObject:value];
        }
        
    }
}

- (NSString *)changeKeyToSetKey:(NSString *)key
{
    NSString *keyStep1 = [key capitalizedString];
    NSString *keyStep2  = nil;
    if ([key isEqualToString:@"id"]) {
        //id ->类目+id
        keyStep2 = [NSString stringWithFormat:@"set%@%@:",NSStringFromClass([self class]),keyStep1];
        //BaseModelId
    }else
    {
        keyStep2 = [NSString stringWithFormat:@"set%@:",keyStep1];
    }
    
    return keyStep2;
}

- (SEL)changeSetKeyToSelector:(NSString *)setKey
{
    
    return NSSelectorFromString(setKey);
}


@end
