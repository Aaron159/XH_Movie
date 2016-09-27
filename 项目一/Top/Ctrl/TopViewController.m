//
//  TopViewController.m
//  项目一
//
//  Created by mac51 on 16/4/9.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "TopViewController.h"
#import "Top250Model.h"
#import "Top250Cell.h"


#define kItemWidth 120
#define kItemHeight 200
#define kItemCount 3

#define kItemSpace (kScreenWidth - kItemCount*kItemWidth)/(kItemCount + 5)

@interface TopViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
     NSMutableArray *dataArr;
}
@property (weak, nonatomic) IBOutlet UICollectionView *topCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *topViewFlowLaout;
@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _topViewFlowLaout.minimumLineSpacing = 10;
    _topViewFlowLaout.minimumInteritemSpacing = kItemSpace;
    _topViewFlowLaout.itemSize = CGSizeMake(kItemWidth, kItemHeight);
    _topViewFlowLaout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    //解析数据
    [self _loadData];
 
    
    //去掉上面的状态栏加导航栏的高度部分
    self.automaticallyAdjustsScrollViewInsets =NO;
    
}

-(void)_loadData
{
    dataArr= [NSMutableArray array];
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"top250" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    id array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSArray *subjects = array[@"subjects"];
    
    for (NSDictionary *dataDic in subjects) {
//        NSDictionary *subject = dataDic[@"subject"];
        Top250Model *model = [[Top250Model alloc] init];

        model.rating = dataDic[@"rating"];
        model.title = dataDic[@"title"];
        model.images = dataDic[@"images"];
        [dataArr addObject:model];
        
    
    }
    
    //    传递数据

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Top250Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Top250CellID" forIndexPath:indexPath];
    cell.model = dataArr[indexPath.row];
    
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
