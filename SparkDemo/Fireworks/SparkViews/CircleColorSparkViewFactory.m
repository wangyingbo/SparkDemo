//
//  CircleColorSparkViewFactory.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "CircleColorSparkViewFactory.h"
#import "CircleColorSparkView.h"

static inline NSArray<UIColor *> *colorSet1() {
    NSArray *colors = @[];
    colors = @[
               [UIColor colorWithRed:0.89 green:0.58 blue:0.70 alpha:1.0],
               [UIColor colorWithRed:0.96 green:0.87 blue:0.62 alpha:1.],
               [UIColor colorWithRed:0.67 green:0.82 blue:0.94 alpha:1.],
               [UIColor colorWithRed:0.54 green:0.56 blue:0.94 alpha:1.],
               ];
    return colors;
}

@implementation CircleColorSparkViewFactory

- (SparkView *)create:(SparkViewFactoryData *)data {
    NSArray *colors = colorSet1();
    CircleColorSparkView *sparkView = [[CircleColorSparkView alloc] initWithColor:colors[data.index % colors.count] size:data.size];
    return sparkView;
}

@end
