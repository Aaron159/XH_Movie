//
//  HomeTableCell.m
//  项目一
//
//  Created by mac51 on 16/4/10.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "HomeTableCell.h"

@implementation HomeTableCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

-(void)setModel:(HomeModel *)model
{
    _model = model;
    
    self.titleLabel.text = _model.title;
    self.oriTitleLabel.text = _model.original_title;
    self.yearLabel.text = [NSString stringWithFormat:@"年份: %@",_model.year];
    self.ratingLabel.text = [NSString stringWithFormat:@"%.1f",[_model.rating[@"average"]floatValue]];
    
    NSString *imageUrl = _model.images[@"medium"];
    
    //NS CG
    //data -》 Url -》 string
    //HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file. 版本更新之后iOS8.0之后不准访问网络，增加了网路访问安全设置
    
    
//    if ([UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]]) {
//        self.imgView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]]];
//    }
    
    [self.imgView  sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"pig"]];
    
      [_starView changeStarWithRating: [self.ratingLabel.text floatValue]];
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
