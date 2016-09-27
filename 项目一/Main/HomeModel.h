//
//  HomeModel.h
//  项目一
//
//  Created by mac51 on 16/4/10.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import  "BaseModel.h"

@interface HomeModel : BaseModel

@property(nonatomic,strong)NSDictionary *rating;  //评分
@property(nonatomic,strong)NSDictionary *images;  //图片
@property(nonatomic,copy) NSString *year;  //年份
@property(nonatomic,copy) NSString *title;  //中文名
@property(nonatomic,copy) NSString *original_title;  //原始名

@end
