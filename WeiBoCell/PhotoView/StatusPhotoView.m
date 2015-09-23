//
//  StatusPhotoView.m
//  WeiBoCell
//
//  Created by Shen Yuan on 15/9/17.
//  Copyright (c) 2015年 Shen Yuan. All rights reserved.
//

#import "StatusPhotoView.h"
#import "PhotoModel.h"
#import "UIView+Extension.h"

@interface StatusPhotoView ()
@property (nonatomic, weak) UIImageView *thumbView;
@end

@implementation StatusPhotoView

- (UIImageView *)thumbView {
    if (!_thumbView) {
        UIImage *image = [UIImage imageNamed:@"timeline_image_gif"];
        UIImageView *gifView = [[UIImageView alloc] initWithImage:image];
//        [self addSubview:gifView];
        self.thumbView = gifView;
    }
    return _thumbView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //内容模式
        self.contentMode = UIViewContentModeScaleAspectFill;
        //超出边框的内容模式要剪掉
        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setPhoto:(PhotoModel *)photo {
    _photo = photo;
    NSLog(@"%@", photo);
    //设置图片
    [self setImage:[UIImage imageNamed:photo]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.thumbView.x = self.width - self.thumbView.width;
    self.thumbView.y = self.height - self.thumbView.height;
}


@end
