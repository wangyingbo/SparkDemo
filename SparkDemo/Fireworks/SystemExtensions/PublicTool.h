//
//  PublicTool.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/15.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PublicTool : NSObject

extern CGPoint pointAdd(CGPoint point,CGVector vector);
extern CGPoint pointMultiply(CGPoint point,CGFloat value);

@end

NS_ASSUME_NONNULL_END
