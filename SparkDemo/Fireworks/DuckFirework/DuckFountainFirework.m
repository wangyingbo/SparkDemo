//
//  DuckFountainFirework.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "DuckFountainFirework.h"
#import "DuckSparkViewFactory.h"


@interface DuckFountainFirework ()

@property (nonatomic, strong) SparkViewFactory *sparkViewFactory;
@end

@implementation DuckFountainFirework

- (SparkViewFactory *)sparkViewFactory {
    if (!_sparkViewFactory) {
        DuckSparkViewFactory *sparkViewFactory = [[DuckSparkViewFactory alloc] init];
        _sparkViewFactory = sparkViewFactory;
    }
    return _sparkViewFactory;
}

@end
