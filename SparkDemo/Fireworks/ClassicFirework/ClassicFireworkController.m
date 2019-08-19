//
//  ClassicFireworkController.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/15.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "ClassicFireworkController.h"
#import "ClassicFirework.h"
#import "ClassicFireworkAnimator.h"

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
@property (nonatomic, strong) ClassicFireworkAnimator *sparkAnimator;
@end

@implementation ClassicFireworkController

- (ClassicFireworkAnimator *)sparkAnimator {
    if (!_sparkAnimator) {
        ClassicFireworkAnimator *sparkAnimator = [[ClassicFireworkAnimator alloc] init];
        _sparkAnimator = sparkAnimator;
    }
    return _sparkAnimator;
}

- (void)addFireworks:(void (^)(ClassicFireworkMaker * _Nonnull))maker toView:(nonnull UIView *)sourceView {
    ClassicFireworkMaker *_maker = [[ClassicFireworkMaker alloc] init];
    !maker?:maker(_maker);
    NSParameterAssert(sourceView);
    if (!sourceView) { return; }
    
    UIView *superview = sourceView.superview;
    NSArray *origins = @[
     [NSValue valueWithCGPoint:CGPointMake(sourceView.frame.origin.x, sourceView.frame.origin.y)],
     [NSValue valueWithCGPoint:CGPointMake(sourceView.frame.origin.x+sourceView.frame.size.width, sourceView.frame.origin.y)],
     [NSValue valueWithCGPoint:CGPointMake(sourceView.frame.origin.x, sourceView.frame.origin.y+sourceView.frame.size.height)],
     [NSValue valueWithCGPoint:CGPointMake(sourceView.frame.origin.x+sourceView.frame.size.width, sourceView.frame.origin.y+sourceView.frame.size.height)],
                         ];
    
    for (NSValue *value in origins) {
        NSInteger idx = arc4random_uniform((uint32_t)(origins.count));
        CGPoint origin = pointAdd(((NSValue *)origins[idx]).CGPointValue, [self randomChangeVector:_maker.maxVectorChange]);
        
        Firework *firework = [self createFireworkWithOrigin:origin sparkSize:_maker.sparkSize scale:_maker.scale];
        
        for (NSInteger sparkIndex = 0; sparkIndex<_maker.sparksCount; sparkIndex++) {
            FireworkSpark *spark = [firework spark:sparkIndex];
            spark.sparkView.hidden = YES;
            [superview addSubview:spark.sparkView];
            
            if (_maker.canChangeZIndex) {
                CGFloat zIndexChange = arc4random_uniform(2) == 0?-1:+1;
                spark.sparkView.layer.zPosition = sourceView.layer.zPosition + zIndexChange;
            }else {
                spark.sparkView.layer.zPosition = sourceView.layer.zPosition;
            }

            [self.sparkAnimator animate:spark duration:_maker.animationDuration];
        }
        
        
    }
}

- (Firework *)createFireworkWithOrigin:(CGPoint)origin sparkSize:(CGSize)sparkSize scale:(CGFloat)scale {
    ClassicFirework *firework = [[ClassicFirework alloc] initFireworkWithOrigin:origin sparkSize:sparkSize scale:scale];
    return firework;
}

- (CGVector)randomChangeVector:(CGFloat)max {
    return CGVectorMake([self randomChange:max], [self randomChange:max]);
}

- (CGFloat)randomChange:(CGFloat)max {
    return (CGFloat)(arc4random_uniform(INT32_C(max)) - (max / 2.0));
}

@end
