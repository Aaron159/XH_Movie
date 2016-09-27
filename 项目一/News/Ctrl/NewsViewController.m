//
//  NewsViewController.m
//  项目一
//
//  Created by mac51 on 16/4/9.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "NewsCellTableViewCell.h"


@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray *_dataArray;
    UIImageView *imageView;
    UILabel *label;
}
@property (weak, nonatomic) IBOutlet UITableView *newsTabelView;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"新闻";
    
    //1.数据解析
    
     [self parseJsonData];
    
    //2.视图创建
    [self configUI];
    
    //3.数据传递
    
   
    //4.头视图的配置

    //小细节，第一个元素什么时候从数组当中去掉
    
    //去掉上面的状态栏加导航栏的高度部分
    self.automaticallyAdjustsScrollViewInsets =NO;
    
}

- (void)configUI
{
    //配置头视图数据源
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, 150)];
    NewsModel *model = _dataArray[0];
    [imageView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view insertSubview:imageView belowSubview:_newsTabelView];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.bounds.size.height-30, kScreenWidth, 30)];
    label.textColor = [UIColor orangeColor];
    label.textAlignment =  NSTextAlignmentCenter;
    label.text = model.title;
    [imageView addSubview:label];
    //采取第一种方式
    UIView *view = [[UIView alloc] initWithFrame:imageView.frame];
    view.backgroundColor = [UIColor clearColor];
    self.newsTabelView.tableHeaderView = view;
   
    //移除
    [_dataArray removeObjectAtIndex:0];
    
   [_newsTabelView registerNib:[UINib nibWithNibName:@"NewsCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"NewsCellID"];
     _newsTabelView.rowHeight = 110;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //修改inset会改变offset
    CGFloat ofy = scrollView.contentOffset.y;
    CGFloat top = scrollView.contentInset.top;
    //    scrollView.contentInset
    
    CGFloat y = ofy + top;
    if (y >= 0) {
        imageView.frame = CGRectMake(0, -y+64,kScreenWidth, 200);
        label.frame = CGRectMake(0, imageView.bounds.size.height-30-50, kScreenWidth, 30);
    }else
    {
        CGFloat height = 200 - y;
        //        CGFloat width
        imageView.frame = CGRectMake(0, 64, kScreenWidth, height);
         label.frame = CGRectMake(0, imageView.bounds.size.height-30-50, kScreenWidth, 30);
       
    }
}

-(void)parseJsonData
{
    _dataArray = [NSMutableArray array];
    
//    //拿到路径
//    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"news_list" ofType:@"json"];
//    
//    //加载数据
//    NSData *data = [NSData dataWithContentsOfFile:filePath];
//    
//    
//    NSArray *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    
    NSArray *array = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"news_list" ofType:@"json"]] options:NSJSONReadingMutableContainers error:NULL];
    
    for (NSDictionary *dataDic in array) {
        NewsModel *model = [[NewsModel alloc]init];
        
        model.title = dataDic[@"title"];
        model.summary = dataDic[@"summary"];
        model.image = dataDic[@"image"];
        model.type = (NewsType)[dataDic[@"type"] integerValue];
        
//        NSLog(@"%@",dataDic);
        [_dataArray addObject:model];
        
    }
    
}



#pragma - mark tableview datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsCellID" forIndexPath:indexPath];
    
    cell.model = _dataArray[indexPath.row];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCellTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *vcid = nil;
    switch (cell.model.type) {
        case WordType:
            vcid = @"NewsWordController";
            break;
        case ImageType:
            vcid = @"NewsImageController";
            break;
            
        case VideoType:
            vcid = @"NewsVideoController";
            break;
            
        default:
            break;
    }
    
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:vcid];
    [self.navigationController pushViewController:vc animated:YES];
    
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
