//
//  Model.h
//  WeiBoCell
//
//  Created by Shen Yuan on 15/9/17.
//  Copyright (c) 2015年 Shen Yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class User;

@interface Model : NSObject
@property (nonatomic, copy) NSString *context;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, strong) NSArray *image;

/**	string	友好显示名称*/
@property (nonatomic, copy) NSString *name;

/**	string	用户头像地址，50×50像素*/
@property (nonatomic, copy) NSString *profile_image_url;

/**	int	转发数*/
@property (nonatomic, assign) int reposts_count;
/**	int	评论数*/
@property (nonatomic, assign) int comments_count;
/**	int	表态数*/
@property (nonatomic, assign) int attitudes_count;

/**	object	微博作者的用户信息字段 详细*/
//@property (nonatomic, strong) User *user;

- (id)initWithDictionary:(NSDictionary *)dict;

+ (id)modelWithDictionary:(NSDictionary *)dict;

@end
