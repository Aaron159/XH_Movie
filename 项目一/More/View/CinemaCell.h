//
//  CinemaCell.h
//  项目一
//
//  Created by mac51 on 16/5/7.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaListModel.h"
@interface CinemaCell : UITableViewCell
@property(nonatomic,strong)CinemaListModel *modelList;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *cinemaAddress;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *isSeatSupportImg;
@property (weak, nonatomic) IBOutlet UIImageView *isGroupBuySupportImg;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *isCouponMark;

@end
