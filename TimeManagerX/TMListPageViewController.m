//
//  TMListPageViewController.m
//  TimeManagerX
//
//  Created by yu on 2017/5/31.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMListPageViewController.h"

@interface TMListPageViewController ()

@end

@implementation TMListPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupListPage];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupListPage{
    //背景颜色
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.title = @"列表";
}


@end
