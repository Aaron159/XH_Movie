//
//  StarView.h
//  项目一
//
//  Created by mac51 on 16/4/10.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView
{
    UIView *_yellow;
    UIView *_gray;
}

-(void)changeStarWithRating:(float)rating;

@end
