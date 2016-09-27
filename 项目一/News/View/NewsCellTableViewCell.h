//
//  NewsCellTableViewCell.h
//  项目一
//
//  Created by mac51 on 16/4/16.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"


@interface NewsCellTableViewCell : UITableViewCell

@property(nonatomic,strong) NewsModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;

@property (weak, nonatomic) IBOutlet UIImageView *typeImage;

@end
