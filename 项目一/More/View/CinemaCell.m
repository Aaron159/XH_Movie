//
//  CinemaCell.m
//  项目一
//
//  Created by mac51 on 16/5/7.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "CinemaCell.h"


@implementation CinemaCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setModelList:(CinemaListModel *)modelList
{
    _modelList = modelList;
    
    self.addressLabel.text = _modelList.cinemaName;
    self.cinemaAddress.text = _modelList.address;
    self.gradeLabel.text = _modelList.grade;
    self.priceLabel.text = [NSString stringWithFormat:@"¥ %@",_modelList.lowPrice];
    
    if (_modelList.isSeatSupport == 1) {
        self.isSeatSupportImg.hidden = YES;
    }
    else
    {
        self.isSeatSupportImg.hidden = NO;
    }
    if (_modelList.isGroupBuySupport ==1) {
        self.isGroupBuySupportImg.hidden = YES;
    }else
    {
        self.isGroupBuySupportImg.hidden = NO;
    }
    if (_modelList.isCouponSupport ==1) {
        self.isCouponMark.hidden = YES;
    }else
    {
        self.isCouponMark.hidden = NO;
    }
    
}

@end
