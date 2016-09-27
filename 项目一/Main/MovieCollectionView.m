//
//  MovieCollectionView.m
//  项目一
//
//  Created by mac51 on 16/4/23.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "MovieCollectionView.h"

@implementation MovieCollectionView

- (instancetype)init
{
    return [self initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
}

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor clearColor];
        //        self.pagingEnabled = YES;
        
        self.decelerationRate= UIScrollViewDecelerationRateFast;
        
        self.showsHorizontalScrollIndicator = NO;
       
    }
    return self;
}

#pragma  - mark UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
#pragma - mark flow Layout delegate
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, (kScreenWidth - _itemWidth) / 2, 0, (kScreenWidth - _itemWidth) / 2);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(_itemWidth, self.height);
}

#pragma  - mark scrollView delegate
//inout 表示参数在当前的方法或者当中修改，其值在外部获取时是修改后的值
//对实参可读可写
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset NS_AVAILABLE_IOS(5_0)
{
//    1、获取偏移值
    CGFloat offsetX = targetContentOffset->x;//CGPoint *结构体指针访问成员变量->
    //(1)获取间隙
    UICollectionViewFlowLayout *layout =(UICollectionViewFlowLayout *) self.collectionViewLayout;
    CGFloat space = layout.minimumLineSpacing;
    //(2)页的宽度
    CGFloat pageWidth = _itemWidth +space;
//    2.判断视图位置，计算当前页数
    NSInteger pageNum = (offsetX +pageWidth / 2) / pageWidth;
//    NSLog(@"%ld",pageNum);
    
//    细节的处理 加速效果下的偏移情况的配置（防止第一张和最后一张拉抄过一半出现崩溃）
    pageNum = velocity.x == 0 ? pageNum:(velocity.x >0 ? pageNum + 1 : pageNum - 1);
    //这种情况不会出现数组越界
    pageNum = MIN((MAX(pageNum, 0)), self.dataArray.count - 1);
//    3.使其置中
    targetContentOffset->x = pageNum *pageWidth;
    
    self.currentIndex = pageNum;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (_currentIndex != indexPath.row) {
        //滑动到对应的视图
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentIndex = indexPath.row;
    }
    
}
#pragma  - mark KVO currentIndex
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    //拿到index
    NSInteger index = [change[@"new"]integerValue];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
    
    if (self.currentIndex != index) {
        //滑动到对应视图
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        
        self.currentIndex = index;
    }
    
    
}

@end
