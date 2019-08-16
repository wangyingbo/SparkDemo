//
//  SparkTrajectory.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/16.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ProtocolKit.h"



NS_ASSUME_NONNULL_BEGIN

@protocol SparkTrajectory <NSObject>
/**<CGPoint>*/
- (NSArray<NSValue *> *)points;
/***/
- (UIBezierPath *)path;
@end

@interface SparkTrajectory : NSObject<SparkTrajectory>

- (instancetype)scale:(CGFloat)value;
- (instancetype)flip;
- (instancetype)shift:(CGPoint)point;

@end

@interface QuadraticBezierTrajectoryClass : SparkTrajectory<SparkTrajectory>
QuadraticBezierTrajectoryClass* quadraticBezierTrajectory(CGFloat x0,CGFloat y0,CGFloat x1,CGFloat y1,CGFloat x2,CGFloat y2);
@end

@interface CubicBezierTrajectoryClass : SparkTrajectory<SparkTrajectory>
CubicBezierTrajectoryClass* cubicBezierTrajectory(CGFloat x0,CGFloat y0,CGFloat x1,CGFloat y1,CGFloat x2,CGFloat y2,CGFloat x3,CGFloat y3);
@end

NS_ASSUME_NONNULL_END
