//
//  ClassicSparkTrajectoryFactoryProtocol.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/16.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SparkTrajectoryFactory.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ClassicSparkTrajectoryFactoryProtocol <NSObject>
- (SparkTrajectory *)randomTopRight;
- (SparkTrajectory *)randomBottomRight;
@end

@interface ClassicSparkTrajectoryFactoryProtocol : SparkTrajectoryFactory<ClassicSparkTrajectoryFactoryProtocol>

@end

NS_ASSUME_NONNULL_END
