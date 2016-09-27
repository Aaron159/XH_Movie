//
//  ImageCell.h
//  项目一
//
//  Created by mac51 on 16/4/17.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageModel.h"
@interface ImageCell : UICollectionViewCell


@property(nonatomic,strong) ImageModel *model;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end
