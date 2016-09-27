//
//  HomeViewController.m
//  项目一
//
//  Created by mac51 on 16/4/9.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableCell.h"
#import "HomeModel.h"

#import "PostView.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL flag;
    NSMutableArray *_dataArray;
}
@property (weak, nonatomic) IBOutlet UITableView *listTableView;

@property (weak, nonatomic) IBOutlet PostView *postView;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1.创建customView 在上面添加两个button
    //2.button点击事件 flag记录当前状态
    //3.点击后flag 取反button视图层级关系改变 +转场动画
    
    _postView.hidden = YES;


    [self _createCustomView];
    
    //1、model数据解析-》数据加载view显示
    [self _parseJsonData];
    
    //注册单元格
    [self.listTableView registerNib:[UINib nibWithNibName:@"HomeTableCell" bundle:nil] forCellReuseIdentifier:@"HomeCellID"];
    self.listTableView.separatorStyle = UITableViewCellAccessoryNone;
    
    //去掉上面的状态栏加导航栏的高度部分
    self.automaticallyAdjustsScrollViewInsets =NO;
}

-(void)_parseJsonData
{
    _dataArray = [NSMutableArray array];
    
    //拿到路径
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"us_box" ofType:@"json"];
    
    //加载数据
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    //解析数据 5.0 JSONkit SBJSON 开源框架
    //    NSJSONReadingMutableContainers = (1UL << 0), 可变容器加载
    //    NSJSONReadingMutableLeaves = (1UL << 1), 可变字符串
    //    NSJSONReadingAllowFragments = (1UL << 2) 其他类型 不是数组和字典
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *subjects = result[@"subjects"];
    
    for (NSDictionary *dataDic in subjects) {
        NSDictionary *subject = dataDic[@"subject"];
        HomeModel *model = [[HomeModel alloc] initWithDictionary:subject];
        
//        NSLog(@"%@", subject[@"rating"]);
        
//        model.rating = subject[@"rating"];
//        model.year = subject[@"year"];
//        model.title = subject[@"title"];
//        model.original_title = subject[@"original_title"];
//        model.images = subject[@"images"];
//        NSLog(@"%@", model.images);
        [_dataArray addObject:model];
    }
    
    //    传递数据
    _postView.dataArray = _dataArray;
    
    
}

-(void)_createCustomView
{
    UIView *gg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    gg.backgroundColor =[UIColor clearColor];

    UIButton *b1 =[[UIButton alloc]initWithFrame:gg.frame];
    //按钮的闪光
    b1.showsTouchWhenHighlighted = YES;
    [b1 setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [b1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [b1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [gg addSubview:b1];
    
    UIButton *b2 =[[UIButton alloc]initWithFrame:gg.frame];
    b2.showsTouchWhenHighlighted = YES;
    [b2 setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [b2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [b2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [gg addSubview:b2];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:gg];

}



- (void)buttonAction:(UIButton *)sender
{
    //1.拿到customView
    UIView *gg =self.navigationItem.rightBarButtonItem.customView;
    //2.视图层级改变
//    将一个UIView显示在最前面只需要调用其父视图的 bringSubviewToFront（）方法。
//    将一个UIView层推送到背后只需要调用其父视图的 sendSubviewToBack（）方法。
    [gg sendSubviewToBack:sender];
    
    UIViewAnimationTransition transition = _postView.hidden ?
      UIViewAnimationTransitionFlipFromLeft:
    UIViewAnimationTransitionFlipFromRight;
    
//    flag = !flag;
//    _postView.hidden = !_postView.hidden;
//    _listTableView.hidden = !_listTableView.hidden;
    
    _listTableView.hidden = _postView.hidden;
    _postView.hidden = !_listTableView.hidden;
    
    //如果在同一个block当中添加两个动画，实际执行第二个，第一个动画没有效果
    
    [UIView animateWithDuration:0.25 animations:^{
        [UIView setAnimationTransition:transition forView:gg cache:YES];
        self.navigationController.navigationBar.translucent = _postView.hidden; 
    }];
    
    [UIView animateWithDuration:0.25 animations:^{
        [UIView setAnimationTransition:transition forView:self.view cache:YES];
    }];
}

#pragma - mark tableview datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCellID" forIndexPath:indexPath];
    
    cell.model = _dataArray[indexPath.row];
    return cell;
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
