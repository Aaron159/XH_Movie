//
//  NewsWordController.m
//  项目一
//
//  Created by mac51 on 16/4/16.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "NewsWordController.h"

@interface NewsWordController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation NewsWordController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com/cn/"]];
    
    [self.webView loadRequest:request];
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
