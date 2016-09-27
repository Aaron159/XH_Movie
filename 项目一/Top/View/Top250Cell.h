//
//  Top250Cell.h
//  项目一
//
//  Created by mac51 on 16/5/7.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Star2View.h"
#import "Top250Model.h"

@interface Top250Cell : UICollectionViewCell

@property(nonatomic,strong)Top250Model *model;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet Star2View *starView;

@end
