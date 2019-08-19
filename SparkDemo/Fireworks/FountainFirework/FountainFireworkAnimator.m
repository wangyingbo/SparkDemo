//
//  FountainFireworkAnimator.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/19.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "FountainFireworkAnimator.h"

@implementation FountainFireworkAnimator

- (void)animate:(FireworkSpark *)spark duration:(NSTimeInterval)duration {
    
    spark.sparkView.hidden = NO;
    
    [CATransaction begin];
    
    // Position
    CAKeyframeAnimation *positionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnim.path = spark.trajectory.path.CGPath;
    positionAnim.calculationMode = kCAAnimationLinear;
    positionAnim.rotationMode = kCAAnimationRotateAuto;
    positionAnim.duration = duration;
    
    // Scale
    CGFloat randomMinScale = 0.1 + (CGFloat)arc4random_uniform(3) / 10.0;
    CGFloat randomMaxScale = 1.2 + (CGFloat)arc4random_uniform(7) / 10.0;
    
    CATransform3D fromTransform = CATransform3DScale(CATransform3DIdentity, randomMinScale, randomMinScale, randomMinScale);
    CATransform3D byTransform = CATransform3DScale(CATransform3DIdentity, randomMaxScale, randomMaxScale, randomMaxScale);
    CATransform3D toTransform = CATransform3DScale(CATransform3DIdentity, 0.2, 0.2, 0.2);
    
    CAKeyframeAnimation *transformAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    transformAnim.values = @[
         [NSValue valueWithCATransform3D:fromTransform],
         [NSValue valueWithCATransform3D:byTransform],
         [NSValue valueWithCATransform3D:byTransform],
         [NSValue valueWithCATransform3D:toTransform],
                             ];
    transformAnim.keyTimes = @[@(0.0), @(0.4), @(0.9), @(1.0)];
    transformAnim.duration = duration;
    transformAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    spark.sparkView.layer.transform = toTransform;
    
    // Opacity
    CAKeyframeAnimation *opacityAnim = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnim.values = @[@(1.0), @(0.0)];
    opacityAnim.keyTimes = @[@(0.95), @(0.98)];
    opacityAnim.duration = duration;
    spark.sparkView.layer.opacity = 0.0;
    
    // Group
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = @[positionAnim, transformAnim, opacityAnim];
    groupAnimation.duration = duration;
    
    // block回调
    [CATransaction setCompletionBlock:^{
        [spark.sparkView removeFromSuperview];
    }];
    
    [spark.sparkView.layer addAnimation:groupAnimation forKey:@"spark-animation"];
    
    [CATransaction commit];
}

@end
