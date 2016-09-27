//
//  SmallCollectionViewCell.m
//  项目一
//
//  Created by mac51 on 16/4/23.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "SmallCollectionViewCell.h"

@implementation SmallCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(HomeModel *)model
{
    
    _model = model;
    [self.smallImage sd_setImageWithURL:[NSURL URLWithString:_model.images[@"small"]]];
}
@end
