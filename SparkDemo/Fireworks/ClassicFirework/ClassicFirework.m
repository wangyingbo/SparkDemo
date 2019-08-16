//
//  ClassicFirework.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/16.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "ClassicFirework.h"
#import <UIKit/UIKit.h>
#import "ClassicSparkTrajectoryFactoryProtocol.h"
#import "SparkViewFactory.h"
#import "PublicTool.h"


/**
 x     |     x
    x  |   x
       |
 ---------------
     x |  x
   x   |
       |     x
 **/


typedef NS_OPTIONS(NSUInteger, FlipOptions) {
    horizontally = 1 << 0,
    vertically = 1 << 1,
};

typedef NS_ENUM(NSUInteger, Quarter) {
    topRight,
    bottomRight,
    bottomLeft,
    topLeft,
};

@interface ClassicFirework ()
@property (nonatomic, strong) SparkTrajectoryFactory *trajectoryFactory;
@property (nonatomic, strong) ClassicSparkTrajectoryFactoryProtocol *classicTrajectoryFactory;
@property (nonatomic, strong) SparkViewFactory *sparkViewFactory;
@property (nonatomic, copy) NSArray *quarters;

@end

@implementation ClassicFirework

- (NSInteger)maxChangeValue {
    return 10;
}

- (SparkTrajectoryFactory *)trajectoryFactory {
    if (!_trajectoryFactory) {
        SparkTrajectoryFactory *trajectoryFactory = [[SparkTrajectoryFactory alloc] init];
        _trajectoryFactory = trajectoryFactory;
    }
    return _trajectoryFactory;
}

- (ClassicSparkTrajectoryFactoryProtocol *)classicTrajectoryFactory {
    if (!_classicTrajectoryFactory) {
        ClassicSparkTrajectoryFactoryProtocol *classicTrajectoryFactory = [[ClassicSparkTrajectoryFactoryProtocol alloc] init];
        _classicTrajectoryFactory = classicTrajectoryFactory;
    }
    return _classicTrajectoryFactory;
}

- (SparkViewFactory *)sparkViewFactory {
    if (!_sparkViewFactory) {
        SparkViewFactory *sparkViewFactory = [[SparkViewFactory alloc] init];
        _sparkViewFactory = sparkViewFactory;
    }
    return _sparkViewFactory;
}

- (NSArray *)quarters {
    if (!_quarters) {
        _quarters = @[
                      @(topRight), @(topRight),
                      @(bottomRight), @(bottomRight),
                      @(bottomLeft), @(bottomLeft),
                      @(topLeft), @(topLeft)
                      ];
    }
    return _quarters;
}

- (SparkViewFactoryData *)sparkViewFactoryData:(NSInteger)index {
    DefaultSparkViewFactoryData *defaultSparkViewFactoryData = [[DefaultSparkViewFactoryData alloc]init];
    defaultSparkViewFactoryData.index = index;
    defaultSparkViewFactoryData.size = self.sparkSize;
    return defaultSparkViewFactoryData;
}

- (SparkView *)sparkView:(NSInteger)index {
    SparkView *sparkV;
    sparkV = [self.sparkViewFactory create:[self sparkViewFactoryData:index]];
    
    return sparkV;
}

- (SparkTrajectory *)trajectory:(NSInteger)index {
    Quarter quarter = (Quarter)[(NSNumber *)self.quarters[index] integerValue];
    FlipOptions options = [self flipOptions:quarter];
    CGVector vector = [self randomChangeVector:options maxValue:[self maxChangeValue]];
    CGPoint sparkOrigin = pointAdd(self.origin, vector);
    
    SparkTrajectory *trajectory = [self randomTrajectory:options];
    trajectory = [trajectory scale:self.scale];
    trajectory = [trajectory shift:sparkOrigin];
    
    return trajectory;
}

- (SparkTrajectory *)randomTrajectory:(FlipOptions)flipOptions {
    SparkTrajectory *trajectory = [[SparkTrajectory alloc]init];
    if (flipOptions & vertically) {
        trajectory = [self.classicTrajectoryFactory randomBottomRight];
    }else {
        trajectory = [self.classicTrajectoryFactory randomTopRight];
    }
    
    return flipOptions & horizontally ? [trajectory flip] : trajectory;
}

- (FlipOptions)flipOptions:(Quarter)quarter {
    FlipOptions options = 0;
    if (quarter == bottomLeft || quarter == topLeft) {
        options = options | horizontally;
    }
    if (quarter == bottomLeft || quarter == bottomRight) {
        options = options | vertically;
    }

    return options;
}

- (CGVector)randomChangeVector:(FlipOptions)flipOptions maxValue:(NSInteger)maxValue {
    
    NSArray *values = @[[NSNumber numberWithFloat:[self randomChange:maxValue]],[NSNumber numberWithFloat:[self randomChange:maxValue]]];
    CGFloat changeX = (flipOptions & horizontally) ? -[(NSNumber *)values[0] floatValue] : [(NSNumber *)values[0] floatValue];
    CGFloat changeY = (flipOptions & vertically) ? [(NSNumber *)values[1] floatValue] : -[(NSNumber *)values[0] floatValue];
    return CGVectorMake(changeX, changeY);
}

- (CGFloat)randomChange:(NSInteger)maxValue {
    return (CGFloat)arc4random_uniform((uint32_t)maxValue);
}
@end
