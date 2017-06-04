//
//  TMLoginViewController.m
//  TimeManagerX
//
//  Created by djwang on 2017/6/1.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMSignViewController.h"
#import "TMHomeViewController.h"

@implementation TMSignViewController

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:nil];
    [self ifLogin];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)ifLogin{
    BmobUser *bUser = [BmobUser currentUser];
    if(bUser != nil){
        TMHomeViewController *homeViewController = [TMHomeViewController new];
        [self presentViewController:homeViewController animated:true completion:nil];
    }else{
        [self setupBackground];
        [self setupSignView];
        [self setupForgetPwdBtn];
    }
}

-(void)setupBackground{
    _backgroundImageView = [UIImageView new];
    _backgroundImageView.image = [UIImage imageNamed:@"登录注册背景.png"];
    [self.view addSubview:_backgroundImageView];
    
    _backgroundImageView.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}


-(void)setupSignView{
    _signView = [[TMSignView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT*3/14, SCREEN_WIDTH, SCREEN_HEIGHT-200)];
    [self.view addSubview:_signView];
}

-(void)setupForgetPwdBtn{
    _forgetPwdBtn = [UIButton new];
    [_forgetPwdBtn setBackgroundColor:[UIColor clearColor]];
    [_forgetPwdBtn setTitle:@"forget password" forState:UIControlStateNormal];
    [self.view addSubview:_forgetPwdBtn];
    
    _forgetPwdBtn.sd_layout
    .yIs(SCREEN_HEIGHT-40)
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .autoHeightRatio(0);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
