//
//  Top250Cell.m
//  项目一
//
//  Created by mac51 on 16/5/7.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "Top250Cell.h"


@implementation Top250Cell
- (void)awakeFromNib
{
    [super awakeFromNib];

}

- (void)setModel:(Top250Model *)model
{
    _model = model;
    
    self.title.text = _model.title;
    self.rating.text = [NSString stringWithFormat:@"%.1f",[_model.rating[@"average"]floatValue]];
    
    NSString *imageUrl = _model.images[@"medium"];
    
    [self.imgView  sd_setImageWithURL:[NSURL URLWithString:imageUrl] ];

     [_starView changeStarWithRating: [self.rating.text floatValue]];
}
@end
