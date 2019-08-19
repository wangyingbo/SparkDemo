//
//  FountainSparkTrajectoryFactory.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "FountainSparkTrajectoryFactory.h"

@implementation FountainSparkTrajectoryFactory

- (SparkTrajectory *)random {
    CGFloat y1 = 1.0 + ((CGFloat)arc4random_uniform(6) - 3) / 10.0;
    CGFloat x2 = (CGFloat)arc4random_uniform(4) - 2.0;
    CGFloat y2 = y1 + 2.0 + ((CGFloat)arc4random_uniform(10) - 5) / 10.0;
    
    return quadraticBezierTrajectory(0.0, 0.0, 0.0, -y1, x2, -y2);
}

@end
