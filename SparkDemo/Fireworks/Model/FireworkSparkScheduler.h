//
//  FireworkSparkScheduler.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SparkViewAnimator.h"
#import "FireworkSpark.h"

NS_ASSUME_NONNULL_BEGIN

@interface Data : NSObject

@end

@interface FireworkSparkScheduler : NSObject

- (void)schedule:(NSArray<FireworkSpark *> *)sparks presenterView:(UIView *)presenterView animator:(SparkViewAnimator *)animator animationDuration:(NSTimeInterval)animationDuration;
@end

NS_ASSUME_NONNULL_END
