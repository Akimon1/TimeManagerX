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
    [self setupPlanView];
    [self setTheLeftButton];
    [self setTheRightButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)setupPlanView{
    NSLog(@"begin to init planview");
    _planView = [[TMPlanView alloc] init];
    [self.view addSubview:_planView];
    
    _planView.sd_layout
    .topSpaceToView(self.view, SCREEN_HEIGHT/5)
    .widthIs(SCREEN_WIDTH)
    .bottomSpaceToView(self.view, 30);
    
    //设置方法让此值跟随事件变化
    _planView.circle.progress = 0.35;
    _planView.circle.totalTime = 25;
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
    _rightButton = [[UIBarButtonItem alloc]initWithTitle:@"即时任务" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = _rightButton;
}
-(void)rightAction{
    _alertController = [UIAlertController alertControllerWithTitle:@"要开始一项即时任务嘛？" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        _presentTaskViewController = [TMPresentTaskViewController new];
        _presentTaskViewController.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:_presentTaskViewController animated:true];
        self.hidesBottomBarWhenPushed=NO;
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [_alertController addAction:ok];
    [_alertController addAction:cancel];
    [self presentViewController:_alertController animated:YES completion:nil];
}

@end
