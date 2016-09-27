//
//  PhotoViewController.m
//  项目一
//
//  Created by mac51 on 16/4/17.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoView.h"
#import "PhotoCell.h"
#import "PhotoLayout.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _configUI];
    
    
}

- (void)_configUI
{
    PhotoLayout *layout = [[PhotoLayout alloc] init];
    PhotoView *view = [[PhotoView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    view.dataArray = self.imageUrls;
    [self.view addSubview:view];
    
    //滑到中间 中间滑动
    [view scrollToItemAtIndexPath:_selectIndexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally
                         animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
