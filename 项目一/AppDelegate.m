//
//  AppDelegate.m
//  项目一
//
//  Created by mac51 on 16/4/9.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import  "GuideViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
//    BaseTabBarController *base =[[BaseTabBarController alloc]init];
//    self.window.rootViewController =base;
    
    //1、判断第一次进来 -》 启动界面 2、如果不是呢？ 直接进入RootTabBarController
    //启动界面点击完成之后 进入RootTabBarController
    
    //沙盒
//    NSLog(@"%@",NSHomeDirectory() );
    
    //沙盒当中取标记
    BOOL flag = [[NSUserDefaults standardUserDefaults] boolForKey:kFirstStartFlag];
    //判断
    
    //进入不同的选择
    if (flag) {
        self.window.rootViewController = [[BaseTabBarController alloc] init];
    }else{
        self.window.rootViewController = [[GuideViewController alloc] init];
        //存入沙盒当中的偏好设置里面的plist文件当中 千万不要忘了同步
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kFirstStartFlag];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
