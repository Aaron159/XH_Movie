//
//  Star2View.m
//  项目一
//
//  Created by mac51 on 16/5/7.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "Star2View.h"

@implementation Star2View
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self _createSubViews];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self _createSubViews];
    self.backgroundColor = [UIColor clearColor];
}

-(void)_createSubViews
{
    _yellow = [[UIView alloc] init];
    _gray = [[UIView alloc] init];
    
    [self addSubview:_gray];
    [self addSubview:_yellow];
    
    //    NSLog(@"%f", self.height);
    UIImage *image = [UIImage imageNamed:@"yellow"];
    //按比例缩放， 添加0.5 的原因在于图片不规则 长宽相差0.5
    float scale = self.height / (image.size.height + 0.5);
    
    //     _gray.frame = CGRectMake(0, 0, 5 * self.height, self.height);
    //    错误不能这样放，里面星星视图没有放大，应该首先放大星星视图，再设置frame
    
    //transform 平移 旋转 缩放，都在改变frame，都是对frame值得设置
    _gray.transform = CGAffineTransformMakeScale(scale, scale);
    _yellow.transform = CGAffineTransformMakeScale(scale, scale);
    
    _gray.frame = CGRectMake(0, 0, 5 * self.height, self.height);
    _yellow.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"yellow"]];
    _gray.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gray"]];
}

- (void)changeStarWithRating:(float)rating
{
    _yellow.frame = CGRectMake(0, 0, 5 * self.height * rating / 10, self.height);
}

@end
