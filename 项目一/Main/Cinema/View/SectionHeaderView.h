//
//  SectionHeaderView.h
//  项目一
//
//  Created by mac51 on 5/18/16.
//  Copyright © 2016 Aaron. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSectionHeaderHeight 35

@interface SectionHeaderView : UITableViewHeaderFooterView

@property(nonatomic, weak, readonly)UIControl *ctrlView;
@property(nonatomic, weak, readonly)UILabel *titleLabel;

@end
