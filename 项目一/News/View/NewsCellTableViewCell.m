//
//  NewsCellTableViewCell.m
//  项目一
//
//  Created by mac51 on 16/4/16.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "NewsCellTableViewCell.h"

@implementation NewsCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(NewsModel *)model
{
    _model = model;
    
    _titleLabel.text = _model.title;
    _summaryLabel.text = _model.summary;
    
    [_img  sd_setImageWithURL:[NSURL URLWithString:_model.image]];
    
    NSString *imageName = nil;
    switch (_model.type) {
        case WordType:
            imageName = @"word";
            break;
        case ImageType:
            imageName = @"sctpxw";
            break;
        case VideoType:
            imageName = @"scspxw";
            break;
        default:
            break;
    }
    
    _typeImage.image = [UIImage imageNamed:imageName];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
