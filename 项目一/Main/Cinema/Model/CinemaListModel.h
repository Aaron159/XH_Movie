//
//  CinemaListModel.h
//  项目一
//
//  Created by mac51 on 16/5/7.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <Foundation/Foundation.h>

//cinema——list
@interface CinemaListModel : NSObject
@property(nonatomic,copy)NSString *cinemaName;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,assign)NSString *grade;
@property(nonatomic,copy)NSString *districtId;
@property(nonatomic,assign)NSString *lowPrice;
@property(nonatomic,assign)BOOL  isSeatSupport;
@property(nonatomic,assign)BOOL isImaxSupport;
@property(nonatomic,assign)BOOL isCouponSupport;
@property(nonatomic,assign)BOOL isGroupBuySupport;


@end
