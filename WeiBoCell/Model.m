//
//  Model.m
//  WeiBoCell
//
//  Created by Shen Yuan on 15/9/17.
//  Copyright (c) 2015年 Shen Yuan. All rights reserved.
//

#import "Model.h"

@implementation Model
- (id)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.imageUrl = dict[@"imageUrl"];
        self.context = dict[@"context"];
        self.image = dict[@"image"];
        self.name = dict[@"user"][@"name"];
        self.profile_image_url = dict[@"user"][@"profile_image_url"];
        self.reposts_count = [dict[@"reposts_count"] intValue];
        self.attitudes_count = [dict[@"attitudes_count"] intValue];
        self.comments_count = [dict[@"comments_count"] intValue];
    }
    return self;
}

+ (id)modelWithDictionary:(NSDictionary *)dict {
    return [[[self class] alloc] initWithDictionary:dict];
}

@end
