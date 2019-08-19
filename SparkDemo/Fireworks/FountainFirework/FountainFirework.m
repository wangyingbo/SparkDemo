//
//  FountainFirework.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "FountainFirework.h"
#import "FountainSparkTrajectoryFactory.h"
#import "CircleColorSparkViewFactory.h"


@interface FountainFirework ()
@property (nonatomic, strong) SparkTrajectoryFactory *trajectoryFactory;
@property (nonatomic, strong) FountainSparkTrajectoryFactory *fountainSparkTrajectory;
@property (nonatomic, strong) SparkViewFactory *sparkViewFactory;
@end

@implementation FountainFirework

- (SparkTrajectoryFactory *)trajectoryFactory {
    if (!_trajectoryFactory) {
        SparkTrajectoryFactory *trajectoryFactory = [[SparkTrajectoryFactory alloc]init];
        _trajectoryFactory = trajectoryFactory;
    }
    return _trajectoryFactory;
}

- (FountainSparkTrajectoryFactory *)fountainSparkTrajectory {
    if (!_fountainSparkTrajectory) {
        FountainSparkTrajectoryFactory *fountainSparkTrajectory = [[FountainSparkTrajectoryFactory alloc] init];
        _fountainSparkTrajectory = fountainSparkTrajectory;
    }
    return _fountainSparkTrajectory;
}

- (SparkViewFactory *)sparkViewFactory {
    if (!_sparkViewFactory) {
        CircleColorSparkViewFactory *sparkViewFactory = [[CircleColorSparkViewFactory alloc] init];
        _sparkViewFactory = sparkViewFactory;
    }
    return _sparkViewFactory;
}

- (NSInteger)maxChangeValue {
    return 10;
}

- (SparkViewFactoryData *)sparkViewFactoryData:(NSInteger)index {
    DefaultSparkViewFactoryData *defaultSparkViewFactoryData = [[DefaultSparkViewFactoryData alloc]init];
    defaultSparkViewFactoryData.index = index;
    defaultSparkViewFactoryData.size = self.sparkSize;
    return defaultSparkViewFactoryData;
}

- (SparkView *)sparkView:(NSInteger)index {
    SparkView *sparkV;
    if ([self.sparkViewFactory respondsToSelector:@selector(create:)]) {
        sparkV = [self.sparkViewFactory create:[self sparkViewFactoryData:index]];
    }
    return sparkV;
}

- (SparkTrajectory *)trajectory:(NSInteger)index {
    SparkTrajectory * sparkTrajectory = [self.fountainSparkTrajectory random];
    [sparkTrajectory scale:self.scale];
    [sparkTrajectory shift:self.origin];
    return sparkTrajectory;
}

@end
