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
    [self setupToPlanDetailBtn];
    [self setupShowPlanListBtn];
    [self setupCreatePlanBtn];
}

-(void)setupShowPlanListBtn {
    _showPlanListBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _showPlanListBtn.frame = CGRectMake(SCREEN_WIDTH*0.20-32, SCREEN_HEIGHT*0.15, 32, 32);
    _showPlanListBtn.layer.cornerRadius = _createPlanBtn.frame.size.width/2;
    _showPlanListBtn.clipsToBounds = YES;
    
    [_showPlanListBtn setBackgroundColor:[UIColor clearColor]];
    [_showPlanListBtn setImage:[UIImage imageNamed:@"list"] forState:0];
    [_showPlanListBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [_showPlanListBtn addTarget:self action:@selector(toPlanListView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_showPlanListBtn];
}

-(void)toPlanListView:(id)sender{
    if ([_showPlanListBtn isEqual:sender]) {
        //TODO
    }
}



-(void)setupCreatePlanBtn {
    _createPlanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _createPlanBtn.frame = CGRectMake(SCREEN_WIDTH*0.80, SCREEN_HEIGHT*0.15, 32, 32);
    _createPlanBtn.layer.cornerRadius = _createPlanBtn.frame.size.width/2;
    _createPlanBtn.clipsToBounds = YES;

    [_createPlanBtn setBackgroundColor:[UIColor clearColor]];
    [_createPlanBtn setImage:[UIImage imageNamed:@"add32"] forState:0];
    [_createPlanBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [_createPlanBtn addTarget:self action:@selector(toCreatePlanView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_createPlanBtn];
}

-(void)toCreatePlanView:(id)sender{
    if([_createPlanBtn isEqual:sender]){
        _planCreateViewController = [TMPlanCreateViewController new];
        _planCreateViewController.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:_planCreateViewController  animated:true];
        self.hidesBottomBarWhenPushed=NO;
    }
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

-(void)setupToPlanDetailBtn{
    _ToPlanDetailBtn = [UIButton new];
    [self.planView addSubview:_ToPlanDetailBtn];
    _ToPlanDetailBtn.backgroundColor = [UIColor clearColor];
    
    _ToPlanDetailBtn.sd_layout
    .topEqualToView(_planView.circle)
    .bottomEqualToView(_planView.circle)
    .rightEqualToView(_planView.circle)
    .leftEqualToView(_planView.circle);
    [_ToPlanDetailBtn addTarget:self action:@selector(toPlanDetailViewWhenTouch:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)toPlanDetailViewWhenTouch:(id)sender{
    if([_ToPlanDetailBtn isEqual:sender]){
        _planDetailViewController = [TMPlanDetailViewController new];
        _planDetailViewController.hidesBottomBarWhenPushed = YES;
        //根据当前planNameLabel的text(雅思托福)生成细节页面
        _planDetailViewController.planNameStr = _planView.planNameLabel.text;
        [self.navigationController pushViewController:_planDetailViewController animated:true];
        self.hidesBottomBarWhenPushed=NO;
    }
}

-(void)setupHomePage{
    //背景颜色
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.title = @"首页";
}

-(void)setTheLeftButton{                                                                     //设置导航栏左按钮
    _leftButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"user32"] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
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
        _presentTaskViewController = [TMPresentTaskViewController new];
        _presentTaskViewController.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:_presentTaskViewController animated:true];
        self.hidesBottomBarWhenPushed=NO;
}

@end
