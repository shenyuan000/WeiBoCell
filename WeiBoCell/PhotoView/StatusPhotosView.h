//
//  StatusPhotosView.h
//  WeiBoCell
//
//  Created by Shen Yuan on 15/9/17.
//  Copyright (c) 2015年 Shen Yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatusPhotosView : UIView
@property (nonatomic, strong) NSArray *photos;

/** 
 根据图片个数计算相册的尺寸
 */

+(CGSize)sizeWithCount:(NSUInteger)count;
@end
