//
//  CircleColorSparkView.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "CircleColorSparkView.h"

@implementation CircleColorSparkView

- (instancetype)initWithColor:(UIColor *)color size:(CGSize)size {
    if (self = [super initWithFrame:CGRectMake(0, 0, size.width, size.height)]) {
        self.backgroundColor = color;
        self.layer.cornerRadius = size.width / 2.0;
    }
    return self;
}

@end
