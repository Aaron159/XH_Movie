//
//  MoreTableViewController.m
//  项目一
//
//  Created by mac51 on 16/4/24.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "MoreTableViewController.h"

//传统的UITableView是不能创建静态单元格，必须使用 UITableViewController
/*
 
 获取缓存的大小
 再
 
 */

@interface MoreTableViewController ()
{
    UIImageView *_iconView;
    UILabel *nickNameLabel;
    NSString *iconName;
    UIImage *iconImage;
}
@property (weak, nonatomic) IBOutlet UILabel *sizeLabel;

@end

@implementation MoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self getImageFromSandBox];
   
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    [self _createHeaderView];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
     //找到缓存数据-》 计算大小 -》清除缓存
    [self  readCacheSize];
}

- (void)clearCache
{
//    [[SDImageCache sharedImageCache] clearDisk];
    NSString *cache = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    [[NSFileManager defaultManager] removeItemAtPath:cache error:NULL];
}

- (void)readCacheSize
{
    NSUInteger size = [self getCacheData];
    
    double mbSize = size / 1024.0 / 1024.0;
    _sizeLabel.text = [NSString stringWithFormat:@"%.2f MB", mbSize];
}

- (NSUInteger )getCacheData
{
    //找到缓存路径
    NSUInteger size = 0;
    //1、简单方法
//    NSUInteger size = [[SDImageCache sharedImageCache] getSize];
    //找到缓存路径
    NSString *cache = [NSHomeDirectory()  stringByAppendingPathComponent:@"Library/Caches"];
    //文件枚举 获取当前路径下的所有文件的属性
    NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:cache];
    //拿到文件夹里面的所有文件
    for (NSString   *fileName in fileEnumerator) {
        //获取所有文件路径
        NSString *filePath = [cache stringByAppendingPathComponent:fileName];
        //获取所有文件的属性
        NSDictionary *dic = [[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:NULL];
        //计算每个文件的大小
        //计算总共文件的大小
        size += [dic fileSize];
    }
    
    return size;
}

-(void)_createHeaderView
{
    _iconView = [[UIImageView alloc]initWithImage: iconImage];
    
    _iconView.frame = CGRectMake(10, 10, 80, 80);
    _iconView.layer.cornerRadius = _iconView.width /2;
    _iconView.layer.masksToBounds = YES;//涉及到多个图层
    _iconView.userInteractionEnabled = YES;
    [_iconView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pickPhoto)]];
    
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 120)];
    headerView.backgroundColor = [UIColor clearColor];
    [headerView addSubview:_iconView];
    
    nickNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 10, 150, 50)];
    nickNameLabel.text = iconName;
    nickNameLabel.font = [UIFont boldSystemFontOfSize:25];
    nickNameLabel.textColor = [UIColor greenColor];// magentaColor 洋红色 RGB颜色系统 CMYB颜色系统
    [headerView addSubview:nickNameLabel];
    
    self.tableView.tableHeaderView = headerView;
    
    
}


-(void)pickPhoto
{
    //获取图片源 -> 弹出相册 -> 选择图片 ->  配置图片到界面
    //获取图片原 相册当中
    //    if ([ UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    //弹出相册
    UIImagePickerController  *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = sourceType;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:NULL];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:NULL];
    //获取需要配置的图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
   
    iconImage = image;
    _iconView.image = iconImage;
   iconName = @"徐辉666666";
    nickNameLabel.text = iconName;
    
    [self saveImageInSandBox];
}

-(void)saveImageInSandBox
{
    //1、plist 2、归档 （NSKeyedArchiver 深拷贝） 3、sqlite 4、CoreData
    if (iconImage != nil) {
        [[NSUserDefaults standardUserDefaults] setObject:iconName forKey:@"iconName"];
        //千万不要忘记同步操作
        [[NSUserDefaults standardUserDefaults] synchronize];
        NSData *data = UIImageJPEGRepresentation(iconImage, 0.8);
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"iconImage"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }

}

-(void)getImageFromSandBox
{
    iconName = [[NSUserDefaults standardUserDefaults] objectForKey:@"iconName"];
    iconImage = [UIImage imageWithData:[[NSUserDefaults standardUserDefaults] objectForKey:@"iconImage"]];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self clearCache];
        [self readCacheSize];
    }
     [self saveImageInSandBox];
//    NSLog(@"%lu", [self getCacheData]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
