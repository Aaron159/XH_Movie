//
//  PhotoLayout.m
//  项目一
//
//  Created by mac51 on 16/4/17.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "PhotoLayout.h"

@implementation PhotoLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
        //设置水平滑动 不需要垂直滑动
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumLineSpacing = 0;
        self.itemSize = CGSizeMake(kScreenWidth, kScreenHeight - 64);
    }
    return self;
}
@end
