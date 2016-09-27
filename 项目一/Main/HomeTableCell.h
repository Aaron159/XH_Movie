//
//  HomeTableCell.h
//  项目一
//
//  Created by mac51 on 16/4/10.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
#import "StarView.h"


//将视图 添加model当中的数据

@interface HomeTableCell : UITableViewCell

@property (nonatomic,strong) HomeModel *model;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *oriTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@property (weak, nonatomic) IBOutlet StarView *starView;



@end
