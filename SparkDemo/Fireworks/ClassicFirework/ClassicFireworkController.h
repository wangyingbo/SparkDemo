//
//  ClassicFireworkController.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/15.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicTool.h"
@class ClassicFireworkMaker;

NS_ASSUME_NONNULL_BEGIN


@interface ClassicFireworkMaker : NSObject
@property (nonatomic, assign) NSInteger fireworksCount;
@property (nonatomic, assign) NSInteger sparksCount;
@property (nonatomic, assign) CGSize sparkSize;
@property (nonatomic, assign) CGFloat scale;
@property (nonatomic, assign) CGFloat maxVectorChange;
@property (nonatomic, assign) CGFloat animationDuration;
@property (nonatomic, assign) BOOL canChangeZIndex;
@end

@interface ClassicFireworkController : NSObject
- (void)addFireworks:(void(^)(ClassicFireworkMaker *maker))maker toView:(UIView *)sourceView;
@end

NS_ASSUME_NONNULL_END
