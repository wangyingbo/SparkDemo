//
//  DuckFountainFireworkController.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "DuckFountainFireworkController.h"
#import "DuckFountainFirework.h"


@implementation DuckFountainFireworkController

- (Firework *)createFireworkWithOrigin:(CGPoint)origin sparkSize:(CGSize)sparkSize scale:(CGFloat)scale {
    DuckFountainFirework *firework = [[DuckFountainFirework alloc] initFireworkWithOrigin:origin sparkSize:sparkSize scale:scale];
    return firework;
}
@end
