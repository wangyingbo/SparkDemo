//
//  ImageSparkView.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "ImageSparkView.h"

@implementation ImageSparkView

- (instancetype)initWithImage:(UIImage *)image size:(CGSize)size {
    if (self = [super initWithFrame:CGRectMake(0, 0, size.width, size.height)]) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        imageView.image = image;
        [self addSubview:imageView];
    }
    return self;
}

@end
