//
//  CinemaViewController.m
//  项目一
//
//  Created by mac51 on 16/4/9.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "CinemaViewController.h"
#import "CinemaListModel.h"
#import "CinemaCell.h"
#import "SectionHeaderView.h"


@interface CinemaViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArr;
    NSMutableDictionary *_cinemaDic;
    BOOL status[30];
}
@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [self _parseJsonData];
    
    [self.cinemaTableView registerNib:[UINib nibWithNibName:@"CinemaCell" bundle:nil] forCellReuseIdentifier:@"CinemaCellID"];
    self.navigationController.navigationBar.translucent = NO;
    _cinemaTableView.rowHeight = 114;
    
}

-(void)_parseJsonData
{
   //district_list.json
    id result1 = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"district_list" ofType:@"json"]] options:NSJSONReadingMutableContainers error:NULL];
    //cinema_list.json
     id result2 = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cinema_list" ofType:@"json"]] options:NSJSONReadingMutableContainers error:NULL];
   
       _dataArr = result1[@"districtList"];
    
     _cinemaDic = [NSMutableDictionary dictionary];
    
    
    for (NSDictionary *dic1 in result2[@"cinemaList"]) {
        CinemaListModel *model1 = [[CinemaListModel alloc]init];
        
        model1.cinemaName = dic1[@"name"];
        model1.address = dic1[@"address"];
        model1.grade = dic1[@"grade"];
        model1.lowPrice = dic1[@"lowPrice"];
        model1.districtId = dic1[@"districtId"];
        model1.isSeatSupport = [dic1[@"isSeatSupport"]integerValue];;
        model1.isGroupBuySupport = [dic1[@"isGroupBuySupport"]integerValue];;
        model1.isCouponSupport = [dic1[@"isCouponSupport"]integerValue];
        //把model分类，吧相同的districtId的model放在一起
        NSString *districtId = model1.districtId;
        //去cinemaDic查找是否districtId已经被创建了
        NSMutableArray *cinemaArr = [_cinemaDic objectForKey:districtId];
        if (cinemaArr == nil) {
            //如果没有找到就创建一个空的数组
            cinemaArr = [NSMutableArray array];
            //吧空的数组和对应得districtId放到字典里面
            [_cinemaDic setObject:cinemaArr forKey:districtId];
        }
        [cinemaArr addObject:model1];
    }

    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
   return _dataArr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
     CinemaCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaCellID" forIndexPath:indexPath];
    
    NSDictionary *dic = _dataArr[indexPath.section];
    NSString *districtID = dic[@"id"];
    NSArray *arr = _cinemaDic[districtID];
    cell.modelList = arr[indexPath.row];
  
    return cell;
}




//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    static NSString *sectionView = @"sectionView";
//    UITableViewHeaderFooterView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionView];
//    if (header == nil) {
//        header = [[UITableViewHeaderFooterView alloc]initWithReuseIdentifier:sectionView];
//        header.textLabel.font = [UIFont boldSystemFontOfSize:16];
//        
//    
//
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
//        [header addGestureRecognizer:tap];
//        
//    }
//    NSDictionary *dic = _dataArr[section];
//    NSString *name = dic[@"name"];
//    header.textLabel.text = name;
//    header.tintColor = [UIColor purpleColor];
//    header.tag = 200 + section;
//    
//    return header;
//}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    static NSString *sectionView = @"sectionView";
    SectionHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:sectionView];
    if (headerView == nil) {
        headerView = [[SectionHeaderView alloc] initWithReuseIdentifier:sectionView];
        
        //添加点击事件
        [headerView.ctrlView addTarget:self action:@selector(controlAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    headerView.ctrlView.tag = 200+section;
    
    NSDictionary *dic = _dataArr[section];
    headerView.titleLabel.text = dic[@"name"];
    
    return headerView;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 35;
//}


-(void)controlAction:(UIControl *)headView
{
    NSInteger section = headView.tag - 200;
    
    status[section] = !status[section];
    
    NSIndexSet *set= [NSIndexSet indexSetWithIndex:section];
    [_cinemaTableView reloadSections:set withRowAnimation:UITableViewRowAnimationFade];
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    if (status[section]) {
//        return 0;
//    }
    if (!status[section]) {
        return 0;
    }
    
    NSDictionary *dic = _dataArr[section];
    NSString *districtID = dic[@"id"];
    NSArray *arr = _cinemaDic[districtID];
    
    return arr.count;
    
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
