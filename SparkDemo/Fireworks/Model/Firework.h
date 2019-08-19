//
//  Firework.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/16.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SparkView.h"
#import "SparkTrajectory.h"
#import "FireworkSpark.h"
#import "SparkTrajectoryFactory.h"
#import "SparkViewFactory.h"

NS_ASSUME_NONNULL_BEGIN

@protocol Firework <NSObject>

- (CGPoint)origin;

- (CGFloat)scale;

- (CGSize)sparkSize;

- (SparkTrajectoryFactory *)trajectoryFactory;

- (SparkViewFactory *)sparkViewFactory;

- (SparkViewFactoryData *)sparkViewFactoryData:(NSInteger)index;

- (SparkView *)sparkView:(NSInteger)index;

- (SparkTrajectory *)trajectory:(NSInteger)index;

@end

@interface Firework : NSObject<Firework>
- (FireworkSpark *)spark:(NSInteger)index;

- (__kindof Firework *)initFireworkWithOrigin:(CGPoint)origin sparkSize:(CGSize)sparkSize scale:(CGFloat)scale;

@end

NS_ASSUME_NONNULL_END
