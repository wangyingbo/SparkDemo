//
//  Firework+Private.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/16.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "Firework.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Firework ()
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat scale;
@property (nonatomic, assign) CGSize sparkSize;
@property (nonatomic, strong) SparkTrajectoryFactory *trajectoryFactory;
@property (nonatomic, strong) SparkViewFactory *sparkViewFactory;
@end

NS_ASSUME_NONNULL_END
