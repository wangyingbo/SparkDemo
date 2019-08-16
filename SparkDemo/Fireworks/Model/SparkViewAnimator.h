//
//  SparkViewAnimator.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/16.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FireworkSpark.h"
NS_ASSUME_NONNULL_BEGIN

@protocol SparkViewAnimator <NSObject>
- (void)animate:(FireworkSpark *)spark duration:(NSTimeInterval)duration;
@end

@interface SparkViewAnimator : NSObject<SparkViewAnimator>

@end

NS_ASSUME_NONNULL_END
