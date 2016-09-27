//
//  UIView+ViewController.m
//  WXMovie85
//
//  Created by wenyuan on 4/17/16.
//  Copyright © 2016 wenyuan. All rights reserved.
//

#import "UIView+ViewController.h"

@implementation UIView (ViewController)

- (UIViewController *)viewController
{
    UIResponder *next = self.nextResponder;
    while (YES) {
        if ([next isKindOfClass:[UIViewController class]]) {
            break;
        }
        next = next.nextResponder;
    }
    
    return (UIViewController *)next;
}

@end
