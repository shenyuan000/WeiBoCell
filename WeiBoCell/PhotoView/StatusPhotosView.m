//
//  StatusPhotosView.m
//  WeiBoCell
//
//  Created by Shen Yuan on 15/9/17.
//  Copyright (c) 2015年 Shen Yuan. All rights reserved.
//

#import "StatusPhotosView.h"
#import "PhotoModel.h"
#import "StatusPhotoView.h"
#import "UIView+Extension.h"

#define HWStatusPhotoWH 70
#define HWStatusPhotoMargin 10
#define HWStatusPhotoMaxCol(count) ((count==4)?2:3)

@implementation StatusPhotosView

- (void)setPhotos:(NSArray *)photos {
    _photos = photos;
    
    NSInteger photosCount = photos.count;
    //创建足够多的图片控件
    while (self.subviews.count < photosCount) {
        StatusPhotoView *photoView = [[StatusPhotoView alloc] init];
        [self addSubview:photoView];
    }
    //遍历所有的图片控件， 设置图片
    for ( int i = 0; i < self.subviews.count; i++) {
        StatusPhotoView *photoView = self.subviews[i];
        if (i < photosCount) {//显示
            photoView.photo = photos[i];
            photoView.hidden = NO;
        } else {
            photoView.hidden = YES;
        }
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    //设置图片的尺寸和位置
    NSInteger photoSCount = self.photos.count;
    int maxCol = HWStatusPhotoMaxCol(photoSCount);
    for (int i = 0; i < photoSCount; i++) {
        StatusPhotoView *photoView = self.subviews[i];
        
        int col = i % maxCol;
        photoView.x = col *(HWStatusPhotoWH + HWStatusPhotoMargin);
        
        int row = i / maxCol;
        photoView.y = row * (HWStatusPhotoWH + HWStatusPhotoMargin);
        photoView.width = HWStatusPhotoWH;
        photoView.height = HWStatusPhotoWH;
    }
}

+(CGSize)sizeWithCount:(NSUInteger)count {
    //最大列数
    int maxCols = HWStatusPhotoMaxCol(count);
    
    NSInteger cols = (count >= maxCols)? maxCols : count;
    
    CGFloat photosW = cols * HWStatusPhotoWH + (cols - 1) * HWStatusPhotoMargin;
    
    //行数
    // 行数
    NSUInteger rows = (count + maxCols - 1) / maxCols;
    CGFloat photosH = rows * HWStatusPhotoWH + (rows - 1) * HWStatusPhotoMargin;
    
    return CGSizeMake(photosW, photosH);

    
}
@end
