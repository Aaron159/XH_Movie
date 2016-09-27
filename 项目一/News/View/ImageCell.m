//
//  ImageCell.m
//  项目一
//
//  Created by mac51 on 16/4/17.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
    
    //设置圆角
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
}

-(void)setModel:(ImageModel *)model
{
    _model = model;
    
    
    [_imgView  sd_setImageWithURL:[NSURL URLWithString:_model.image]];
    
}

@end
