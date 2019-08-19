//
//  DemoVC.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SparkHeader.h"

typedef NS_ENUM(NSUInteger,SparkType) {
    SparkTypeClassic = 0,
    SparkTypeFountain,
};

NS_ASSUME_NONNULL_BEGIN

@interface DemoVC : UIViewController
@property (nonatomic, assign) SparkType type;
@property (nonatomic, copy) NSString *name;
@end

NS_ASSUME_NONNULL_END
