//
//  SparkTrajectoryFactory.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/16.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SparkTrajectory.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SparkTrajectoryFactory <NSObject>
@end

@interface SparkTrajectoryFactory : NSObject

@end

@protocol DefaultSparkTrajectoryFactory <SparkTrajectoryFactory>
- (SparkTrajectory *)random;
@end



@interface DefaultSparkTrajectoryFactory : NSObject<DefaultSparkTrajectoryFactory>

@end

NS_ASSUME_NONNULL_END
