//
//  PusheenFountainFirework.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "PusheenFountainFirework.h"
#import "PusheenSparkViewFactory.h"

@interface PusheenFountainFirework ()

@property (nonatomic, strong) SparkViewFactory *sparkViewFactory;
@end


@implementation PusheenFountainFirework

- (SparkViewFactory *)sparkViewFactory {
    if (!_sparkViewFactory) {
        PusheenSparkViewFactory *sparkViewFactory = [[PusheenSparkViewFactory alloc] init];
        _sparkViewFactory = sparkViewFactory;
    }
    return _sparkViewFactory;
}

@end
