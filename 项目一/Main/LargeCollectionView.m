//
//  LargeCollectionView.m
//  项目一
//
//  Created by mac51 on 16/4/23.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "LargeCollectionView.h"
#import "LargeCollectionViewCell.h"
@implementation LargeCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(nonnull UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        self.itemWidth = kScreenWidth - 100;
     
        //注册单元格
        [self registerNib:[UINib nibWithNibName:@"LargeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"LargeCellID"];
        
    }
    return self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LargeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LargeCellID" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}
#pragma - mark flow Layout delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
 
    return CGSizeMake(self.itemWidth, self.height - 60);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section

{
    return UIEdgeInsetsMake(60, (kScreenWidth - self.itemWidth)/2, 0, (kScreenWidth - self.itemWidth)/2);
}



@end
