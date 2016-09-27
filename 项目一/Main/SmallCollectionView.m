//
//  SmallCollectionView.m
//  项目一
//
//  Created by mac51 on 16/4/23.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "SmallCollectionView.h"
#import "SmallCollectionViewCell.h"

@implementation SmallCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.itemWidth = 70;
        //注册单元格
        [self registerNib:[UINib nibWithNibName:@"SmallCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"SmallCellID"];
        
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SmallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SmallCellID" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}
#pragma - mark flow Layout delegate

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return  UIEdgeInsetsMake(0, <#CGFloat left#>, 0, <#CGFloat right#>)
//}

@end
