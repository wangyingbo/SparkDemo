//
//  ViewController.m
//  SparkDemo
//
//  Created by fengbang on 2019/8/15.
//  Copyright © 2019 王颖博. All rights reserved.
//
//  https://juejin.im/post/5d540ad0e51d4561f17a509c
//  https://github.com/tomkowz/fireworks

#import "ViewController.h"
#import "ClassicFireworkController.h"


@interface ViewController ()
@property (nonatomic, strong) ClassicFireworkController *fireworkController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configUI];
}

#pragma mark - configUI

- (void)configUI {
    CGFloat w = 150.f;
    CGFloat h = 50.f;
    UIColor *color = [UIColor colorWithRed:0.42 green:0.58 blue:0.98 alpha:1];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(FULL_SCREEN_WIDTH/2 - w/2, FULL_SCREEN_HEIGHT/2 - h/2, w, h)];
    [button setTitle:@"🍦🍰🍎" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 5;
    button.backgroundColor = color;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    CALayer *layer = button.layer;
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOffset = CGSizeMake(0, 10.);
    layer.shadowRadius = 6.0;
    layer.shadowOpacity = 0.3;
    CGFloat shadowWidth = layer.bounds.size.width * 0.9;
    CGRect shadowRect = CGRectMake((0 + (layer.bounds.size.width - shadowWidth) / 2.0), 0, shadowWidth, layer.bounds.size.height);
    layer.shadowPath = [UIBezierPath bezierPathWithRect:shadowRect].CGPath;
    layer.zPosition = 2;
}

#pragma mark - configData

- (void)configData {
    self.fireworkController = [[ClassicFireworkController alloc] init];
}

#pragma mark - actions

- (void)buttonClick:(UIButton *)sender {
    
    [self.fireworkController addFireworks:^(ClassicFireworkMaker * _Nonnull maker) {
        maker.sourceView = sender;
    }];
}

@end
