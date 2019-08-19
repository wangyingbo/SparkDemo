//
//  PusheenSparkViewFactory.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "PusheenSparkViewFactory.h"
#import "ImageSparkView.h"

@interface PusheenSparkViewFactory ()
@property (nonatomic, copy) NSArray *images;

@end

@implementation PusheenSparkViewFactory

- (NSArray *)images {
    if (!_images) {
        NSArray *arr = @[];
        NSMutableArray *mutArr = [NSMutableArray array];
        for (int i = 1; i<8; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"pusheen-%d",i]];
            [mutArr addObject:image];
        }
        arr = mutArr.copy;
        _images = arr;
    }
    return _images;
}

- (SparkView *)create:(SparkViewFactoryData *)data {
    UIImage *image = self.images[data.index % self.images.count];
    ImageSparkView *sparkImageView = [[ImageSparkView alloc] initWithImage:image size:data.size];
    return sparkImageView;
}
@end
