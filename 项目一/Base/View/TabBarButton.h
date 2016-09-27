//
//  TabBarButton.h
//  项目一
//
//  Created by mac51 on 16/4/9.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TabBarButton : UIControl
{
    UIImageView *imageView;
    UILabel *titleLabel;
}


-(instancetype)initWithFrame:(CGRect)frame
               withImageName:(NSString *)imageName
                   withTitle:(NSString *)title;

@end
