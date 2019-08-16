//
//  ClassicSparkTrajectoryFactory.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/16.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "ClassicSparkTrajectoryFactory.h"

@implementation ClassicSparkTrajectoryFactory

- (SparkTrajectory *)randomTopRight {
    static NSArray *randomTopArr = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        randomTopArr = @[
              cubicBezierTrajectory(0.00, 0.00, 0.31, -0.46, 0.74, -0.29, 0.99, 0.12),
              cubicBezierTrajectory(0.00, 0.00, 0.31, -0.46, 0.62, -0.49, 0.88, -0.19),
              cubicBezierTrajectory(0.00, 0.00, 0.10, -0.54, 0.44, -0.53, 0.66, -0.30),
              cubicBezierTrajectory(0.00, 0.00, 0.19, -0.46, 0.41, -0.53, 0.65, -0.45),
                      ];
    });
    SparkTrajectory *trajectory = randomTopArr[(NSInteger)arc4random_uniform((uint32_t)randomTopArr.count)];
    return trajectory;
}

- (SparkTrajectory *)randomBottomRight {
    static NSArray *randomBottomArr = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        randomBottomArr = @[
            cubicBezierTrajectory(0.00, 0.00, 0.42, -0.01, 0.68, 0.11, 0.87, 0.44),
            cubicBezierTrajectory(0.00, 0.00, 0.35, 0.00, 0.55, 0.12, 0.62, 0.45),
            cubicBezierTrajectory(0.00, 0.00, 0.21, 0.05, 0.31, 0.19, 0.32, 0.45),
            cubicBezierTrajectory(0.00, 0.00, 0.18, 0.00, 0.31, 0.11, 0.35, 0.25),
                         ];
    });
    SparkTrajectory *trajectory = randomBottomArr[(NSInteger)arc4random_uniform((uint32_t)randomBottomArr.count)];
    return trajectory;
}

@end
