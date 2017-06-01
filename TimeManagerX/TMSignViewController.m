//
//  TMLoginViewController.m
//  TimeManagerX
//
//  Created by djwang on 2017/6/1.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMSignViewController.h"


@implementation TMSignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBackground];
    [self setupSignView];
}


-(void)setupBackground{
    _backgroundImageView = [UIImageView new];
    _backgroundImageView.image = [UIImage imageNamed:@"Group.png"];
    [self.view addSubview:_backgroundImageView];
    
    _backgroundImageView.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}


-(void)setupSignView{
    _signView = [[TMSignView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HEIGHT-200)];
    [self.view addSubview:_signView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
