//
//  SparkTrajectory.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/16.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "SparkTrajectory.h"
#import "SparkTrajectory+Private.h"
#import "PublicTool.h"

@implementation SparkTrajectory

- (instancetype)scale:(CGFloat)value {
    if (self.points.count<1) {
        return self;
    }
    NSMutableArray *mutArr = [NSMutableArray array];
    for (NSValue *v in self.points) {
        CGPoint point = v.CGPointValue;
        CGPoint scalePoint = pointMultiply(point, value);
        [mutArr addObject:[NSValue valueWithCGPoint:scalePoint]];
    }
    self.points = mutArr.copy;
    return self;
}

- (instancetype)flip {
    if (self.points.count<1) {
        return self;
    }
    NSMutableArray *mutArr = [NSMutableArray array];
    for (NSValue *v in self.points) {
        CGPoint point = v.CGPointValue;
        CGPoint scalePoint = CGPointMake(point.x *= -1, point.y);
        [mutArr addObject:[NSValue valueWithCGPoint:scalePoint]];
    }
    self.points = mutArr.copy;
    return self;
}

- (instancetype)shift:(CGPoint)point {
    if (self.points.count<1) {
        return self;
    }
    NSMutableArray *mutArr = [NSMutableArray array];
    for (NSValue *v in self.points) {
        CGPoint p = v.CGPointValue;
        CGVector vector = CGVectorMake(point.x, point.y);
        CGPoint scalePoint = pointAdd(p, vector);
        [mutArr addObject:[NSValue valueWithCGPoint:scalePoint]];
    }
    self.points = mutArr.copy;
    return self;
}

@end

@implementation QuadraticBezierTrajectoryClass

QuadraticBezierTrajectoryClass* quadraticBezierTrajectory(CGFloat x0,CGFloat y0,CGFloat x1,CGFloat y1,CGFloat x2,CGFloat y2) {
    QuadraticBezierTrajectoryClass *quadraticTrajectory = [[QuadraticBezierTrajectoryClass alloc] init];
    NSMutableArray *mutArr = [NSMutableArray array];
    [mutArr addObject:[NSValue valueWithCGPoint:CGPointMake(x0, y0)]];
    [mutArr addObject:[NSValue valueWithCGPoint:CGPointMake(x1, y1)]];
    [mutArr addObject:[NSValue valueWithCGPoint:CGPointMake(x2, y2)]];
    quadraticTrajectory.points = mutArr.copy;
    return quadraticTrajectory;
}

- (UIBezierPath *)path {
    NSAssert(self.points.count == 3, @"3 points required.");
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:[(NSValue *)self.points[0] CGPointValue]];
    [path addQuadCurveToPoint:[(NSValue *)self.points[2] CGPointValue] controlPoint:[(NSValue *)self.points[1] CGPointValue]];
    return path;
}

@end

@implementation CubicBezierTrajectoryClass

CubicBezierTrajectoryClass* cubicBezierTrajectory(CGFloat x0,CGFloat y0,CGFloat x1,CGFloat y1,CGFloat x2,CGFloat y2,CGFloat x3,CGFloat y3) {
    CubicBezierTrajectoryClass *cubicTrajectory = [[CubicBezierTrajectoryClass alloc] init];
    NSMutableArray *mutArr = [NSMutableArray array];
    [mutArr addObject:[NSValue valueWithCGPoint:CGPointMake(x0, y0)]];
    [mutArr addObject:[NSValue valueWithCGPoint:CGPointMake(x1, y1)]];
    [mutArr addObject:[NSValue valueWithCGPoint:CGPointMake(x2, y2)]];
    [mutArr addObject:[NSValue valueWithCGPoint:CGPointMake(x3, y3)]];
    cubicTrajectory.points = mutArr.copy;
    return cubicTrajectory;
}

- (UIBezierPath *)path {
    NSAssert(self.points.count == 4, @"4 points required.");
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:[(NSValue *)self.points[0] CGPointValue]];
    [path addCurveToPoint:[(NSValue *)self.points[3] CGPointValue] controlPoint1:[(NSValue *)self.points[1] CGPointValue] controlPoint2:[(NSValue *)self.points[2] CGPointValue]];
    return path;
}

@end
