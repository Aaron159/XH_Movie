//
//  BaseTabBarController.m
//  项目一
//
//  Created by mac51 on 16/4/9.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "BaseTabBarController.h"
#import "TabBarButton.h"
@interface BaseTabBarController ()
{
    UIImageView *selectImg; //遮盖视图
}
@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self _createViewControllers];
    
    [self _createTabBar];
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
    
    
}

-(void)_createViewControllers
{
    NSArray *names =@[@"Home",@"News",@"Top",@"Cinema",@"More"];
    NSMutableArray *viewControllers =[NSMutableArray array];
    
    for (NSString *name in names) {
        //1.获取UIStoryboard
        UIStoryboard *sb =[UIStoryboard storyboardWithName:name bundle:nil];
        //2.获取Storyboard中的UIViewController
        UIViewController *vc =[sb instantiateInitialViewController];
        
        //3.加入到viewControllers
        [viewControllers addObject:vc];
    }
    self.viewControllers =viewControllers;

}

//视图将要出现
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //代码上的优化
    //1、移除系统当中的UITabBarButton
    //UITabBarButton 系统当中框架的私有类 外部不能访问
    for (UIView *view in self.tabBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [view removeFromSuperview];
        }
    }
}

-(void)_createTabBar
{
    CGFloat itemWidth =[UIScreen mainScreen].bounds.size.width / 5;
//    //1、移除系统当中的UITabBarButton
//    //UITabBarButton 系统当中框架的私有类 外部不能访问
//    for (UIView *view in self.tabBar.subviews) {
//        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            [view removeFromSuperview];
//        }
//    }
    
    selectImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"selectTabbar_bg_all1"]];
    selectImg.frame = CGRectMake(0, 0, 53, 45);
    [self.tabBar addSubview:selectImg];
    
    
    //2、添加自己的button
    NSArray *nameArray = @[@"首页",@"新闻",@"TOP",@"影院",@"更多"];
    NSArray *imageNameArray =@[
                               @"movie_home",
                               @"msg_new",
                               @"start_top250",
                               @"icon_cinema",
                               @"more_setting"
                               ];
    for (int i = 0; i < nameArray.count; i++) {
        NSString *title =nameArray[i];
        NSString *imageName =imageNameArray[i];
        
        TabBarButton *button =[[TabBarButton alloc]initWithFrame:CGRectMake(i *itemWidth, 0, itemWidth, 49) withImageName:imageName withTitle:title];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 100 +i;
        [self.tabBar addSubview:button];
       
       //优化选择位置
        selectImg.center = [self.tabBar viewWithTag:100].center;
    }
    
    
}

-(void)buttonAction:(UIButton *)button
{
    self.selectedIndex = button.tag - 100;
    //键盘弹出的速度为0.25
    [UIView animateWithDuration:0.25 animations:^{
      
        selectImg.center = button.center;
        
    }];
    
    

}

#pragma mark - UINavigationDlegate
-(void)show:(BOOL)hidden{
    if(hidden == YES){
        [UIView animateWithDuration:0.3 animations:^{
            self.tabBar.frame = CGRectMake(-kScreenWidth, kScreenHeight - 49, kScreenWidth, 49);}];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            self.tabBar.frame = CGRectMake(0,kScreenHeight - 49, kScreenWidth, 49);}];
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if(navigationController.viewControllers.count == 2)
    {
        [self show:YES];
    }else{
        [self show:NO];
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
