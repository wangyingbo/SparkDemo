//
//  FireworkSpark.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/16.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SparkView.h"
#import "SparkTrajectory.h"

NS_ASSUME_NONNULL_BEGIN

@interface FireworkSpark : NSObject
@property (nonatomic, strong) SparkTrajectory *trajectory;
@property (nonatomic, strong) SparkView *sparkView;
@end

NS_ASSUME_NONNULL_END
