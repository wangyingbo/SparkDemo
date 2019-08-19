//
//  DuckSparkViewFactory.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "DuckSparkViewFactory.h"
#import "ImageSparkView.h"

@implementation DuckSparkViewFactory

- (SparkView *)create:(SparkViewFactoryData *)data {
    UIImage *image = [UIImage imageNamed:@"duck"];
    ImageSparkView *sparkImageView = [[ImageSparkView alloc] initWithImage:image size:data.size];
    return sparkImageView;
}

@end
