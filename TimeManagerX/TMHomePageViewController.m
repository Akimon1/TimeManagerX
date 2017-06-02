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
    self.navigationItem.title = @"首页";
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
    _rightButton = [[UIBarButtonItem alloc]initWithTitle:@"点一下" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = _rightButton;
}
-(void)rightAction{
    _alertController = [UIAlertController alertControllerWithTitle:@"你进行了一波操作\n但什么都没有发生。" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"好的，我知道了。" style:UIAlertActionStyleDefault handler:nil];
    [_alertController addAction:ok];
    [self presentViewController:_alertController animated:YES completion:nil];
}

@end
