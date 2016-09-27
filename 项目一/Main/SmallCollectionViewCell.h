//
//  SmallCollectionViewCell.h
//  项目一
//
//  Created by mac51 on 16/4/23.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

@interface SmallCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *smallImage;
@property(nonatomic,strong) HomeModel *model;
@end
