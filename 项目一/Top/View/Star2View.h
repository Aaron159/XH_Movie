//
//  Star2View.h
//  项目一
//
//  Created by mac51 on 16/5/7.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Star2View : UIView
{
    UIView *_yellow;
    UIView *_gray;
}

-(void)changeStarWithRating:(float)rating;
@end
