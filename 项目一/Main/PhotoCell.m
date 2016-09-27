//
//  PhotoCell.m
//  项目一
//
//  Created by mac51 on 16/4/17.
//  Copyright © 2016年 Aaron. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell
{
    UIImageView *imageView;
    UIAlertController  *alert;
}

- (instancetype)init
{
    return [self initWithFrame:CGRectZero];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _createSubViews];
    }
    return self;
}

//其他的 准确来说是比较特殊的一些初始化方法 比如nib加载
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self _createSubViews];
    }
    return self;
}

- (void)_createSubViews
{
    imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    
    imageView.contentMode = UIViewContentModeScaleAspectFit;//Fill 和 Fit区别
    imageView.userInteractionEnabled = YES;
    
    [imageView addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(savePhoto:)]];
    
    [self.contentView   addSubview:imageView];
}


- (void)savePhoto:(UIGestureRecognizer *)ge
{
    alert = [UIAlertController alertControllerWithTitle:@"Do u want to save the picture?" message:@"sure" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"Ok!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //        保存图片
        UIImage *image = imageView.image;
        
        if (image) {
            MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
            hud.labelText = @"Saving";
            hud.dimBackground = YES;
            
            UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo: ), (__bridge void * _Nullable)(hud));
        }
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"NO!" style:UIAlertActionStyleCancel handler:NULL]];
    
    //    [self]
    [self.viewController presentViewController:alert animated:YES completion:NULL];
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    MBProgressHUD *hud = (__bridge MBProgressHUD *)(contextInfo);
    
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark"]];
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = @"保存图片成功!";
    [hud hide:YES afterDelay:1.5];
    
    [alert dismissViewControllerAnimated:YES completion:NULL];
}

- (void)setImageUrl:(NSString *)imageUrl
{
    _imageUrl = imageUrl;
    [imageView sd_setImageWithURL:[NSURL URLWithString:_imageUrl]];
}
@end
