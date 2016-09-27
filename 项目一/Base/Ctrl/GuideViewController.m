//
//  GuideViewController.m
//  项目一
//
//  Created by mac51 on 5/9/16.
//  Copyright © 2016 Aaron. All rights reserved.
//

#import "GuideViewController.h"
#import "BaseTabBarController.h"

@interface GuideViewController ()<UIScrollViewDelegate>

@end

@implementation GuideViewController

-(void)dealloc
{
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self  createUI];
    
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)createUI
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(5 * kScreenWidth, kScreenHeight);
    scrollView.showsHorizontalScrollIndicator = NO;
    
    for (int i = 0; i < 5; i ++) {
        NSString *imageName = [NSString stringWithFormat:@"guide%d@2x",i+1];
        NSString *progressImageName = [NSString stringWithFormat:@"guideProgress%d@2x",i+1];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * kScreenWidth, 0, kScreenWidth, kScreenHeight)];
        imageView.image = [UIImage imageNamed:imageName];
        
        UIImageView *progressView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:progressImageName]];
        progressView.frame = CGRectMake((kScreenWidth - progressView.image.size.width) / 2, kScreenHeight - 50, progressView.image.size.width, progressView.image.size.height);
        
        [imageView addSubview:progressView];
        [scrollView addSubview:imageView];
    }
    [self.view addSubview:scrollView];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x == kScreenWidth * 4) {
        BaseTabBarController *root = [[BaseTabBarController alloc] init];
        //        self.view.window.rootViewController = root;
        //        //转场动画，更好的用户体验
        [UIView transitionWithView:self.view.window duration:1 options:UIViewAnimationOptionTransitionCurlDown   animations:^{
            self.view.window.rootViewController = root;
        } completion:^(BOOL finished) {
            
        }];
    }
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
