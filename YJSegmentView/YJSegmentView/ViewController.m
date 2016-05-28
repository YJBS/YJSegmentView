//
//  ViewController.m
//  YJSegmentView
//
//  Created by YJHou on 16/5/28.
//  Copyright © 2016年 YJHou. All rights reserved.
//

#import "ViewController.h"
#import "YJSegmentView.h"

@interface ViewController () <YJSegmentViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YJSegmentView * segment = [[YJSegmentView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 44)];
    segment.backgroundColor = [UIColor lightGrayColor];
    segment.dataSource = self;
    [self.view addSubview:segment];
    
    
    
    
    
    
    
    
    
}

- (NSArray *)segmentView:(YJSegmentView *)segmentView{
    return @[@"我的", @"哈哈"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
