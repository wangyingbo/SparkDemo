//
//  FBWeakTimer.h
//  FengbangB
//
//  Created by fengbang on 2019/5/24.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeakTimer : NSObject


/**
 创建弱引用的timer

 @param interval 时间间隔
 @param tempTarget 执行selector的target
 @param selector 执行的方法
 @param userInfo userInfo description
 @param repeats repeats description
 @return timer
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval target:(id)tempTarget selector:(SEL)selector userInfo:(nullable id)userInfo repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END
