//
//  StatusFrame.m
//  WeiBoCell
//
//  Created by ShenYuan on 15/9/20.
//  Copyright (c) 2015年 Shen Yuan. All rights reserved.
//

#import "StatusFrame.h"
#import "Model.h"
#import "NSString+Extension.h"
#import "StatusPhotosView.h"
//#import "User.h"

@implementation StatusFrame

- (void)setModel:(Model *)model {
    _model = model;
//    User *user = model.user;
    
    //cell的宽度
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    
     /* 主体 */
    
    /** 头像 */
    CGFloat iconWH = 35;
    CGFloat iconX = HWStatusCellBorderW;
    CGFloat iconY = HWStatusCellBorderW;
    self.iconViewF = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    /** 昵称 */
    CGFloat nameX = CGRectGetMaxX(self.iconViewF) + HWStatusCellBorderW;
    CGFloat nameY = iconY + 7;
//    NSLog(@" user %@", user);
    NSLog(@" user.name = %@", model.name);
    CGSize nameSize = [model.name sizeWithFont:HWStatusCellNameFont];
    self.nameLabelF = (CGRect){{nameX, nameY}, nameSize};
    
    /** 正文 */
    CGFloat contentX = iconX;
    CGFloat contentY = MAX(CGRectGetMaxY(self.iconViewF), CGRectGetMaxY(self.nameLabelF)) + HWStatusCellBorderW;;
    CGFloat maxW = cellW - 2 * contentX;
    CGSize contentSize = [model.context sizeWithFont:HWStatusCellContentFont maxW:maxW];
    self.contentLabelF = (CGRect){{contentX, contentY}, contentSize};
    
    /** 配图 */
    CGFloat originalH = 0;
    if (model.image.count) { // 有配图
        CGFloat photosX = contentX;
        CGFloat photosY = CGRectGetMaxY(self.contentLabelF) + HWStatusCellBorderW;
        CGSize photosSize = [StatusPhotosView sizeWithCount:model.image.count];
        self.photosViewF = (CGRect){{photosX, photosY}, photosSize};
        
        originalH = CGRectGetMaxY(self.photosViewF) + HWStatusCellBorderW;
    } else { // 没配图
        originalH = CGRectGetMaxY(self.contentLabelF) + HWStatusCellBorderW;
    }
    
    /** 原创微博整体 */
    CGFloat originalX = 0;
    CGFloat originalY = HWStatusCellMargin;
    CGFloat originalW = cellW;
    self.originalViewF = CGRectMake(originalX, originalY, originalW, originalH);
    
    /** 工具条 */
    CGFloat toolbarX = 0;
    CGFloat toolbarY = CGRectGetMaxY(self.originalViewF);
    CGFloat toolbarW = cellW;
    CGFloat toolbarH = 35;
    self.toolbarF = CGRectMake(toolbarX, toolbarY, toolbarW, toolbarH);


    /* cell的高度 */
    self.cellHeight = CGRectGetMaxY(self.toolbarF);
}

@end
