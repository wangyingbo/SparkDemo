//
//  SparkTrajectory+Private.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/16.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "SparkTrajectory.h"

NS_ASSUME_NONNULL_BEGIN

@interface SparkTrajectory ()
@property (nonatomic, copy) NSArray<NSValue *> *points;
@property (nonatomic, strong) UIBezierPath *path;
@end

NS_ASSUME_NONNULL_END
