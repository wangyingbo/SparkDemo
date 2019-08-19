//
//  FountainFireworkController.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "FountainFireworkController.h"
#import "FireworkSparkScheduler.h"
#import "FountainFirework.h"
#import "FountainFireworkAnimator.h"

@implementation FountainFireworkMaker
- (instancetype)init {
    if (self = [super init]) {
        _sparksCount = 8;
        _sparkSize = CGSizeMake(9., 9.);
        _scale = 45.f;
        _offsetY = 0.;
        _animationDuration = .8;
    }
    return self;
}

@end



@interface FountainFireworkController ()
@property (nonatomic, strong) FireworkSparkScheduler *scheduler;
@end

@implementation FountainFireworkController

- (FireworkSparkScheduler *)scheduler {
    if (!_scheduler) {
        FireworkSparkScheduler *scheduler = [[FireworkSparkScheduler alloc] init];
        _scheduler = scheduler;
    }
    return _scheduler;
}

- (void)addFireworks:(void (^)(FountainFireworkMaker * _Nonnull))maker toView:(UIView *)sourceView {
    
    NSParameterAssert(sourceView);
    if (!sourceView) { return; }
    
    FountainFireworkMaker *_maker = [[FountainFireworkMaker alloc] init];
    !maker?:maker(_maker);
    
    UIView *superview = sourceView.superview;
    CGPoint origin = CGPointMake(sourceView.frame.origin.x+sourceView.frame.size.width/2, sourceView.frame.origin.y - _maker.offsetY);
    Firework *firework = [self createFireworkWithOrigin:origin sparkSize:_maker.sparkSize scale:_maker.scale];
    
    for (NSInteger sparkIndex = 0; sparkIndex<_maker.sparksCount; sparkIndex ++ ) {
        FireworkSpark *spark = [firework spark:sparkIndex];
        spark.sparkView.hidden = YES;
        [superview addSubview:spark.sparkView];
        
        FountainFireworkAnimator *animator = [[FountainFireworkAnimator alloc] init];
        [self.scheduler schedule:@[spark] presenterView:superview animator:animator animationDuration:_maker.animationDuration];
    }
}

- (Firework *)createFireworkWithOrigin:(CGPoint)origin sparkSize:(CGSize)sparkSize scale:(CGFloat)scale {
    FountainFirework *firework = [[FountainFirework alloc] initFireworkWithOrigin:origin sparkSize:sparkSize scale:scale];
    return firework;
}
@end
