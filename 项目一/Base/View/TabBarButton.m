//
//  TabBarButton.m
//  项目一
//
//  Created by mac51 on 16/4/9.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "TabBarButton.h"


#define kItemSize 20

@implementation TabBarButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
               withImageName:(NSString *)imageName
                   withTitle:(NSString *)title
{
    if (self = [super initWithFrame:frame]) {
        //初始化imageView 和titleLabel
       imageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width - kItemSize ) / 2, 5, kItemSize, kItemSize)];
        
        imageView.image = [UIImage imageNamed:imageName];
        
        //UIViewContentModeScaleAspectFit 缩放
        //UIViewContentModeScaleAspectFill 按比例填满
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:imageView];
        
        titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame) + 5, frame.size.width, 15)];
        
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.text = title;
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.backgroundColor = [UIColor clearColor];
        
        [self addSubview:titleLabel];
    }
    
    return self;
}

@end
