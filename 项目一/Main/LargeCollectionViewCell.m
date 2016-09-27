//
//  LargeCollectionViewCell.m
//  项目一
//
//  Created by mac51 on 16/4/23.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "LargeCollectionViewCell.h"

@implementation LargeCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setModel:(HomeModel *)model
{
    _model = model;
    [self.postImage sd_setImageWithURL:[NSURL URLWithString:_model.images[@"large"]]];
}
@end
