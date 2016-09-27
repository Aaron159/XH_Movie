//
//  MovieCollectionView.h
//  项目一
//
//  Created by mac51 on 16/4/23.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCurrentIndex @"currentIndex"

//1、读数据
//2、配置cell
//3、签协议

@interface MovieCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, assign) CGFloat itemWidth;

@property (nonatomic,assign) NSInteger currentIndex;

@end
