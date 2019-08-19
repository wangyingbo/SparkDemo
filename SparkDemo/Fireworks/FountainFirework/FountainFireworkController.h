//
//  FountainFireworkController.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FountainFireworkMaker : NSObject
@property (nonatomic, assign) NSInteger sparksCount;
@property (nonatomic, assign) CGSize sparkSize;
@property (nonatomic, assign) CGFloat scale;
@property (nonatomic, assign) CGFloat offsetY;
@property (nonatomic, assign) NSTimeInterval animationDuration;
@end

@interface FountainFireworkController : NSObject
- (void)addFireworks:(void(^)(FountainFireworkMaker *maker))maker toView:(UIView *)sourceView;
@end

NS_ASSUME_NONNULL_END
