//
//  PostView.h
//  项目一
//
//  Created by mac51 on 16/4/23.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieCollectionView.h"
/* 多态的条件
 1、必须有继承
 2、必须有重写
 3、父类的指针指向子类的对象
 */

#define kHeaderHeight 130
#define kFooterHeight 30
#define kSmallHeight 100


@interface PostView : UIView
{
    UIImageView *_headView;
    UILabel *_titleLabel;
    UIView *maskView;//蒙蔽视图
    
    MovieCollectionView *_largeView;
    MovieCollectionView *_smallView;
}

@property (nonatomic, strong) NSMutableArray *dataArray;

@end
