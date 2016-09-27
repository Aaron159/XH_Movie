//
//  PhotoViewController.h
//  项目一
//
//  Created by mac51 on 16/4/17.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "BaseViewController.h"

@interface PhotoViewController : BaseViewController
@property (nonatomic, strong) NSArray *imageUrls;

@property (nonatomic, strong) NSIndexPath *selectIndexPath;

@end
