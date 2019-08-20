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
#import "DemoVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configTableView];
    NSLog(@"13:22");
}

#pragma mark - configUI
- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        tableView.separatorInset = UIEdgeInsetsMake(0.5, 14, 0, 0);
        tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
        [self.view addSubview:tableView];
        _tableView = tableView;
    }
    return _tableView;
}

- (void)configTableView {
    self.title = @"Spark Demo";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

#pragma mark - configData
- (NSArray *)dataArray {
    if (!_dataArray) {
        NSArray *arr = @[
             [TitleItem create:SparkTypeClassic name:@"classic"],
             [TitleItem create:SparkTypeFountain name:@"fountain"],
             [TitleItem create:SparkTypePusheen name:@"pusheen"],
             [TitleItem create:SparkTypeDuck name:@"duck"],
                         ];
        _dataArray = arr;
    }
    return _dataArray;
}

#pragma mark - delegate
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([self class])];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:NSStringFromClass(self.class)];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    TitleItem *item = self.dataArray[indexPath.row];
    cell.textLabel.text = item.name?:@"";
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TitleItem *item = self.dataArray[indexPath.row];
    DemoVC *vc = [[DemoVC alloc] init];
    vc.type = item.tag.integerValue;
    vc.name = item.name?:@"";
    [self.navigationController pushViewController:vc animated:YES];
}

@end


@implementation TitleItem
+ (instancetype)create:(NSInteger)tag name:(NSString *)name {
    TitleItem *item = [[TitleItem alloc] init];
    item.tag = [NSNumber numberWithInteger:tag];
    item.name = name;
    return item;
}
@end
