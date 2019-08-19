//
//  ViewController.h
//  SparkDemo
//
//  Created by fengbang on 2019/8/15.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleItem : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *tag;
+ (instancetype)create:(NSInteger)tag name:(NSString *)name;
@end

@interface ViewController : UIViewController


@end

