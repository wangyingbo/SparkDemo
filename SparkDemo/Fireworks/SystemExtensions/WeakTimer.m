//
//  FBWeakTimer.m
//  FengbangB
//
//  Created by fengbang on 2019/5/24.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "WeakTimer.h"
#import "SparkHeader.h"


@interface WeakTimer ()
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer *tempTimer;
@property (nonatomic, weak) id tempTarget;
@end

@implementation WeakTimer

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)tempTarget selector:(SEL)selector userInfo:(id)userInfo repeats:(BOOL)repeats {
    WeakTimer *weakObject = [[WeakTimer alloc] init];
    weakObject.tempTarget = tempTarget;
    weakObject.selector = selector;
    weakObject.tempTimer = [NSTimer scheduledTimerWithTimeInterval:interval target:weakObject selector:@selector(timerSelector:) userInfo:userInfo repeats:repeats];
    return weakObject.tempTimer;
}

- (void)timerSelector:(NSTimer *)tempTimer {
    if (self.tempTarget && [self.tempTarget respondsToSelector:self.selector]) {
        SafePerformSelector(
                            [self.tempTarget performSelector:self.selector withObject:tempTimer.userInfo];
                            );
    }else {
        [self.tempTimer invalidate];
    }
}
@end
