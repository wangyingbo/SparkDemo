//
//  PusheenFountainFireworkController.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "PusheenFountainFireworkController.h"
#import "PusheenFountainFirework.h"

@implementation PusheenFountainFireworkController

- (Firework *)createFireworkWithOrigin:(CGPoint)origin sparkSize:(CGSize)sparkSize scale:(CGFloat)scale {
    PusheenFountainFirework *firework = [[PusheenFountainFirework alloc] initFireworkWithOrigin:origin sparkSize:sparkSize scale:scale];
    return firework;
}

@end
