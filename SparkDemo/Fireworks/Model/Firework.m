//
//  Firework.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/16.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "Firework.h"
#import "Firework+Private.h"

@interface Firework ()

@end

@implementation Firework
- (FireworkSpark *)spark:(NSInteger)index {
    FireworkSpark *fireworkSpark = [[FireworkSpark alloc] init];
    if ([self respondsToSelector:@selector(sparkView:)]) {
        SparkView *sparkView = [self sparkView:index];
        fireworkSpark.sparkView = sparkView;
    }
    if ([self respondsToSelector:@selector(trajectory:)]) {
        SparkTrajectory *trajectory = [self trajectory:index];
        fireworkSpark.trajectory = trajectory;
    }
    return fireworkSpark;
}


@end
