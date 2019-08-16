//
//  Firework.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/16.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Firework <NSObject>
- (CGPoint)origin;
- (CGFloat)scale;
- (CGSize)sparkSize;

@end

@interface Firework : NSObject<Firework>

@end

NS_ASSUME_NONNULL_END
