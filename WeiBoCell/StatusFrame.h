//
//  StatusFrame.h
//  WeiBoCell
//
//  Created by ShenYuan on 15/9/20.
//  Copyright (c) 2015年 Shen Yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

// 昵称字体
#define HWStatusCellNameFont [UIFont systemFontOfSize:15]
// 正文字体
#define HWStatusCellContentFont [UIFont systemFontOfSize:14]

// cell之间的间距
#define HWStatusCellMargin 15

// cell的边框宽度
#define HWStatusCellBorderW 10
@class Model;

@interface StatusFrame : NSObject
@property (nonatomic, strong) Model *model;

//整体
@property (nonatomic, assign) CGRect originalViewF;

/** 头像 */
@property (nonatomic, assign) CGRect iconViewF;

/** 昵称 */
@property (nonatomic, assign) CGRect nameLabelF;

/** 正文 */
@property (nonatomic, assign) CGRect contentLabelF;

/** 配图 */
@property (nonatomic, assign) CGRect photosViewF;

/** 底部工具条 */
@property (nonatomic, assign) CGRect toolbarF;

/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;
@end
