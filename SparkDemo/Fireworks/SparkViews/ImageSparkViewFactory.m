//
//  ImageSparkViewFactory.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "ImageSparkViewFactory.h"
#import "ImageSparkView.h"

@implementation ImageSparkViewFactory

- (SparkView *)create:(SparkViewFactoryData *)data {
    ImageSparkView *sparkView = [[ImageSparkView alloc] initWithImage:[UIImage imageNamed:@""] size:data.size];
    return sparkView;
}

@end
