//
//  NewsImageController.m
//  项目一
//
//  Created by mac51 on 16/4/16.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "NewsImageController.h"
#import "ImageModel.h"
#import "ImageCell.h"
#import "PhotoViewController.h"

#define kItemWidth 88
#define kItemHeight 60
#define kItemCount 4

#define kItemSpace (kScreenWidth - kItemCount*kItemWidth)/(kItemCount + 8)


@interface NewsImageController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSMutableArray *_dataArray;
}
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollectView;
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *layout;

@end

@implementation NewsImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _layout.minimumLineSpacing = 10;
    _layout.minimumInteritemSpacing = kItemSpace;
    _layout.itemSize = CGSizeMake(kItemWidth, kItemHeight);
    _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    [_imageCollectView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellWithReuseIdentifier:@"ImageCellID"];
    
//    [_imageCollectView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellReuseIdentifier:@"NewsCellID"];//少了个with
    
    self.title = @"图片新闻";
    
    [self parseJsonData];
    
    
}

-(void)parseJsonData
{
    _dataArray = [NSMutableArray array];
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"image_list" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    for (NSDictionary *dic in result) {
        ImageModel *model = [[ImageModel alloc]init];
        model.image = dic[@"image"];
        
        [_dataArray addObject:model];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCell *cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"ImageCellID" forIndexPath:indexPath ];
   
    cell.model = _dataArray[indexPath.row];
    
    return cell;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
//    UIViewController *vc = [[UIViewController alloc]init];
//    
//    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(0, (kScreenHeight/2) -100, kScreenWidth, 200)];
//    ImageModel *model = [[ImageModel alloc]init];
//    model = _dataArray[indexPath.row];
//    [img sd_setImageWithURL:[NSURL URLWithString:model.image]];
//    [vc.view addSubview:img];
    
    PhotoViewController *vc = [[PhotoViewController alloc] init];
    vc.selectIndexPath = indexPath;
    NSMutableArray *array = [NSMutableArray array];
    for (ImageModel *model in _dataArray) {
        [array addObject:model.image];
    }
    
    vc.imageUrls = array;
    
    //底部标签栏
    vc.hidesBottomBarWhenPushed=YES;
    
    [self.navigationController pushViewController:vc animated:YES];
    
    
//    [self.navigationController pushViewController:vc animated:YES];
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
