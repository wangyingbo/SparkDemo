//
//  ClassicFireworkController.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/15.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "ClassicFireworkController.h"

@implementation ClassicFireworkMaker

- (instancetype)init {
    if (self = [super init]) {
        _fireworksCount = 1;
        _sparksCount = 8;
        _sparkSize = CGSizeMake(7, 7);
        _scale = 45.f;
        _maxVectorChange = 15.f;
        _animationDuration = 0.4f;
        _canChangeZIndex = YES;
    }
    return self;
}

@end


@interface ClassicFireworkController ()
@end

@implementation ClassicFireworkController

- (void)addFireworks:(void (^)(ClassicFireworkMaker * _Nonnull))maker {
    ClassicFireworkMaker *_maker = [[ClassicFireworkMaker alloc] init];
    !maker?:maker(_maker);
    NSParameterAssert(_maker.sourceView);
    if (!_maker.sourceView) { return; }
    
    UIView *sourceView = _maker.sourceView;
    UIView *superview = sourceView.superview;
    NSArray *origins = @[
     [NSValue valueWithCGPoint:CGPointMake(sourceView.frame.origin.x, sourceView.frame.origin.y)],
     [NSValue valueWithCGPoint:CGPointMake(sourceView.frame.origin.x+sourceView.frame.size.width, sourceView.frame.origin.y)],
     [NSValue valueWithCGPoint:CGPointMake(sourceView.frame.origin.x, sourceView.frame.origin.y+sourceView.frame.size.height)],
     [NSValue valueWithCGPoint:CGPointMake(sourceView.frame.origin.x+sourceView.frame.size.width, sourceView.frame.origin.y+sourceView.frame.size.height)],
                         ];
    
    for (NSValue *value in origins) {
        NSInteger idx = arc4random_uniform((uint32_t)(origins.count));
        CGPoint origin = pointAdd(value.CGPointValue, [self randomChangeVector:_maker.maxVectorChange]);
    }
}

- (CGVector)randomChangeVector:(CGFloat)max {
    return CGVectorMake([self randomChange:max], [self randomChange:max]);
}

- (CGFloat)randomChange:(CGFloat)max {
    return (CGFloat)(arc4random_uniform(INT32_C(max)) - (max / 2.0));
}

@end
