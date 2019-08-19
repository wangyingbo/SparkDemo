//
//  ClassicSparkTrajectoryFactory.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/16.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "ClassicSparkTrajectoryFactory.h"

@interface ClassicSparkTrajectoryFactory ()
@property (nonatomic, copy) NSArray *randomTopArr;
@property (nonatomic, copy) NSArray *randomBottomArr;
@end

@implementation ClassicSparkTrajectoryFactory

- (NSArray *)randomTopArr {
    if (!_randomTopArr) {
        NSArray *randomTopArr = @[
          cubicBezierTrajectory(0.00, 0.00, 0.31, -0.46, 0.74, -0.29, 0.99, 0.12),
          cubicBezierTrajectory(0.00, 0.00, 0.31, -0.46, 0.62, -0.49, 0.88, -0.19),
          cubicBezierTrajectory(0.00, 0.00, 0.10, -0.54, 0.44, -0.53, 0.66, -0.30),
          cubicBezierTrajectory(0.00, 0.00, 0.19, -0.46, 0.41, -0.53, 0.65, -0.45),
                                  ];
        _randomTopArr = randomTopArr;
    }
    return _randomTopArr;
}

- (NSArray *)randomBottomArr {
    if (!_randomBottomArr) {
        NSArray *randomBottomArr = @[
         cubicBezierTrajectory(0.00, 0.00, 0.42, -0.01, 0.68, 0.11, 0.87, 0.44),
         cubicBezierTrajectory(0.00, 0.00, 0.35, 0.00, 0.55, 0.12, 0.62, 0.45),
         cubicBezierTrajectory(0.00, 0.00, 0.21, 0.05, 0.31, 0.19, 0.32, 0.45),
         cubicBezierTrajectory(0.00, 0.00, 0.18, 0.00, 0.31, 0.11, 0.35, 0.25),
                                     ];
        _randomBottomArr = randomBottomArr;
    }
    return _randomBottomArr;
}

- (SparkTrajectory *)randomTopRight {
    NSArray *randomTopArr = self.randomTopArr;
    SparkTrajectory *trajectory = randomTopArr[(NSInteger)arc4random_uniform((uint32_t)randomTopArr.count)];
    trajectory = randomTopArr[0];
    return trajectory;
}

- (SparkTrajectory *)randomBottomRight {
    NSArray *randomBottomArr = self.randomBottomArr;
    SparkTrajectory *trajectory = randomBottomArr[(NSInteger)arc4random_uniform((uint32_t)randomBottomArr.count)];
    return trajectory;
}

@end
