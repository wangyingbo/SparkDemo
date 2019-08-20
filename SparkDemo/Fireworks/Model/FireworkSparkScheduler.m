//
//  FireworkSparkScheduler.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "FireworkSparkScheduler.h"
#import <UIKit/UIKit.h>
#import "WeakTimer.h"




@interface Data ()
@property (nonatomic, assign) NSTimeInterval animationDuration;
@property (nonatomic, weak) UIView *presenterView;
@property (nonatomic, copy) NSArray<FireworkSpark *> *sparks;
@property (nonatomic, strong) SparkViewAnimator *animator;
@end

@implementation Data
@end




@interface FireworkSparkScheduler ()
@property (nonatomic, assign) NSTimeInterval delay;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray<Data *> *queue;
@end

@implementation FireworkSparkScheduler
- (instancetype)init {
    if (self = [super init]) {
        _delay = 0.05;
        _queue = [NSMutableArray array];
    }
    return self;
}

- (void)schedule:(NSArray<FireworkSpark *> *)sparks presenterView:(UIView *)presenterView animator:(SparkViewAnimator *)animator animationDuration:(NSTimeInterval)animationDuration {
    
    Data *d = [[Data alloc] init];
    d.sparks = sparks;
    d.presenterView = presenterView;
    d.animator = animator;
    d.animationDuration = animationDuration;
    [self.queue addObject:d];
    
    if (!self.timer) {
        [self scheduleTimer];
    }
}

- (void)cancel {
    if (!self.timer) {
        return;
    }
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scheduleTimer {
    [self cancel];
    self.timer = [WeakTimer scheduledTimerWithTimeInterval:self.delay target:self selector:@selector(timerDidFire) userInfo:nil repeats:YES];
}

- (void)timerDidFire {
    Data *d = [self.queue firstObject];
    NSParameterAssert(d);
    if (!d) {
        [self cancel];
        return;
    }
    
    NSParameterAssert(d.presenterView);
    if (!d.presenterView) {
        [self cancel];
        return;
    }
    UIView *presenterView = d.presenterView;
    
    for (FireworkSpark *spark in d.sparks) {
        [presenterView addSubview:spark.sparkView];
        [d.animator animate:spark duration:d.animationDuration];
    }
    
    [self.queue removeObjectAtIndex:0];
    
    if (self.queue.count == 0) {
        [self cancel];
    }
}

@end


