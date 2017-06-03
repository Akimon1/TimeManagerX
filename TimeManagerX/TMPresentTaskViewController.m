//
//  TMPresentTaskViewController.m
//  TimeManagerX
//
//  Created by yu on 2017/6/3.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMPresentTaskViewController.h"
#import "TMHomeViewController.h"

@interface TMPresentTaskViewController ()
@property (nonatomic,strong) TMHomeViewController *homeViewVontroller;
@end

@implementation TMPresentTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupPresentTask];
    [self setTheLeftButton];
    [self setTheRightButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)setupPresentTask{
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)setTheLeftButton{                                                                     //设置导航栏左按钮
    _leftButton = [[UIBarButtonItem alloc]initWithTitle:@"放弃任务" style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    self.navigationItem.leftBarButtonItem = _leftButton;
}
-(void)leftAction{
    _alertController = [UIAlertController alertControllerWithTitle:@"放弃任务？" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        _homeViewVontroller = [TMHomeViewController new];
        [self presentViewController:_homeViewVontroller animated:true completion:nil];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [_alertController addAction:ok];
    [_alertController addAction:cancel];
    [self presentViewController:_alertController animated:YES completion:nil];
}

-(void)setTheRightButton{                                                                     //设置导航栏右按钮
    _rightButton = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = _rightButton;
}
-(void)rightAction{
    _alertController = [UIAlertController alertControllerWithTitle:@"保存任务？" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        _saveTaskViewController = [TMSaveTaskViewController new];
        [self.navigationController pushViewController:_saveTaskViewController animated:true];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [_alertController addAction:ok];
    [_alertController addAction:cancel];
    [self presentViewController:_alertController animated:YES completion:nil];
}


@end
