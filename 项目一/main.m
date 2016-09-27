//
//  main.m
//  项目一
//
//  Created by mac51 on 16/4/9.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

//main函数的作用 程序进入的入口 开启主线程

//oc：开启一个全局的自动释放池
//调用UIApplicationMain
//UIApplicationMain
//创建UIApplication 对象- App
//在UIApplicationMain开启 runloop
//argc 参数个数 argv 参数值
//第三个参数 一般为 nil 是UIApplication类或其子类，99。99%都是nil，指的是UIApplication类
//设置app的代理
//

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
