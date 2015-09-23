//
//  WeiBoCell.m
//  WeiBoCell
//
//  Created by Shen Yuan on 15/9/17.
//  Copyright (c) 2015年 Shen Yuan. All rights reserved.
//

#import "WeiBoCell.h"
#import "Model.h"
#import "NSString+Extension.h"
#import "StatusPhotosView.h"
#import "StatusFrame.h"
//#import "User.h"
#import "HWStatusToolbar.h"

@interface WeiBoCell ()

/** 微博控件 */

/** 整体 */
@property (nonatomic, weak) UIView *originalView;


/** 头像 */

@property (nonatomic, weak) UIImageView *iconView;

/** 昵称 */
@property (nonatomic, weak) UILabel *nameLabel;


/** 正文*/
@property (nonatomic, weak)UILabel *contentLab;

/** 配图*/
@property (nonatomic, weak) StatusPhotosView *photosView;

/** 工具条 */
@property (nonatomic, weak) HWStatusToolbar *toolbar;

@end
@implementation WeiBoCell



+(instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *Id = @"status";
    WeiBoCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if (!cell) {
        cell = [[WeiBoCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Id];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier  {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        // 点击cell的时候不要变色
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        
        [self setupOriginal];
    }
    return self;
}

/**
 * 初始化工具条
 */
- (void)setupToolbar
{
    HWStatusToolbar *toolbar = [HWStatusToolbar toolbar];
    [self.contentView addSubview:toolbar];
    self.toolbar = toolbar;
}

/** 初始化微博*/
- (void)setupOriginal
{
    [self setupToolbar];
    
    /** 原创微博整体 */
    UIView *originalView = [[UIView alloc] init];
    originalView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:originalView];
    self.originalView = originalView;
    
    
    //头像
    
    UIImageView *iconView = [[UIImageView alloc] init];
    [originalView addSubview:iconView];
    self.iconView = iconView;
    
    //呢称
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = HWStatusCellNameFont;
    [originalView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    
    //正文
    UILabel *contentLab = [[UILabel alloc] init];
    [originalView addSubview:contentLab];
    self.contentLab = contentLab;
    self.contentLab.numberOfLines = 0;
    
    
//    配图
    StatusPhotosView *photosView = [[StatusPhotosView alloc] init];
    [originalView addSubview:photosView];
    self.photosView = photosView;
    


}


- (void)setStatusFrame:(StatusFrame *)statusFrame {
    _statusFrame = statusFrame;
    Model *model = statusFrame.model;
//    User *user = model.user;
    
    //整体
    self.originalView.frame = statusFrame.originalViewF;
    
    //头像
    self.iconView.frame = statusFrame.iconViewF;
    self.iconView.layer.masksToBounds = YES;
    [self.iconView.layer setCornerRadius:statusFrame.iconViewF.size.width / 2];

    [self.iconView setImage:[UIImage imageNamed:model.profile_image_url]];
    
    /** 昵称 */
    self.nameLabel.text = model.name;
    self.nameLabel.frame = statusFrame.nameLabelF;
    
    /** 正文 */
    self.contentLab.text = model.context;
    self.contentLab.frame = statusFrame.contentLabelF;
    
    /** 配图 */
    if (model.image.count) {
        self.photosView.frame = statusFrame.photosViewF;
        self.photosView.photos = model.image;
        self.photosView.hidden = NO;
    } else {
        self.photosView.hidden = YES;
    }
    
    /** 工具条 */
    self.toolbar.frame = statusFrame.toolbarF;
    self.toolbar.model = model;

}


@end
