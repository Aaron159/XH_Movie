//
//  Top250Model.h
//  项目一
//
//  Created by mac51 on 16/4/23.
//  Copyright © 2016年 Aaron. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface Top250Model : NSObject

@property (nonatomic,strong) NSDictionary *rating;
@property(nonatomic,strong)NSDictionary *images;
@property(nonatomic,copy)NSString *title;
@end
