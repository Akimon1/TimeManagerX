//
//  TMHomePageViewController.m
//  TimeManagerX
//
//  Created by yu on 2017/5/31.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMHomePageViewController.h"

@interface TMHomePageViewController ()

@end

@implementation TMHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setupHomePage];
    [self setTheLeftButton];
    [self setTheRightButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)setupHomePage{
    //背景颜色
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(void)setTheLeftButton{                                                                     //设置导航栏左按钮
    _leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"person"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    self.navigationItem.leftBarButtonItem = _leftButton;
}
-(void)leftAction{
    _personViewController = [TMPersonalViewController new];
    _personViewController.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:_personViewController  animated:true];
    self.hidesBottomBarWhenPushed=NO;
}

-(void)setTheRightButton{                                                                     //设置导航栏右按钮
    _rightButton = [[UIBarButtonItem alloc]initWithTitle:@"右" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = _rightButton;
}
-(void)rightAction{
}

@end
