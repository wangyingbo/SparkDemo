//
//  SparkViewFactory.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/16.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SparkView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SparkViewFactoryData <NSObject>
- (CGSize)size;
- (NSInteger)index;
@end
@interface SparkViewFactoryData : NSObject<SparkViewFactoryData>
@end



@protocol SparkViewFactory <NSObject>
- (SparkView *)create:(SparkViewFactoryData *)data;
@end
@interface SparkViewFactory : NSObject<SparkViewFactory>
@end



@interface DefaultSparkViewFactoryData : SparkViewFactoryData<SparkViewFactoryData>
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) NSInteger index;
@end

NS_ASSUME_NONNULL_END
