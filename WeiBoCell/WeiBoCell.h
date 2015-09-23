//
//  WeiBoCell.h
//  WeiBoCell
//
//  Created by Shen Yuan on 15/9/17.
//  Copyright (c) 2015年 Shen Yuan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Model;
@class StatusFrame;

@interface WeiBoCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) Model *model;

@property (nonatomic, strong) StatusFrame *statusFrame;
@end
