//
//  PublicTool.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/15.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "PublicTool.h"

@implementation PublicTool

inline CGPoint pointAdd(CGPoint point,CGVector vector) {
    return CGPointMake(point.x+vector.dx, point.y+vector.dy);
}

inline CGPoint pointMultiply(CGPoint point,CGFloat value) {
    return CGPointMake(point.x *= value, point.y *= value);
}

@end
