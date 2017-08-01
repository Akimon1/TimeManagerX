//
//  TMHomePageViewController.h
//  TimeManagerX
//
//  Created by yu on 2017/5/31.
//  Copyright © 2017年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMPersonalViewController.h"
#import "TMPlanView.h"
#import "pop.h"
#import "TMPresentTaskViewController.h"
#import "TMPlanDetailViewController.h"
#import "TMPlanCreateViewController.h"
#import "TMPlanListViewController.h"



@interface TMHomePageViewController : UIViewController
@property (nonatomic,strong) UIBarButtonItem *leftButton;
@property (nonatomic,strong) UIBarButtonItem *rightButton;
@property (nonatomic,strong) TMPersonalViewController *personViewController;
@property (nonatomic,strong) UIAlertController *alertController;
@property (nonatomic,strong) TMPresentTaskViewController *presentTaskViewController;

@property (strong,nonatomic) TMPlanView *planView;
@property (strong,nonatomic) UIButton *ToPlanDetailBtn;
@property (nonatomic,strong) TMPlanDetailViewController *planDetailViewController;

@property (strong,nonatomic) TMPlanListViewController *planListViewController;

//右上方触发
@property (strong,nonatomic) UIButton *createPlanBtn;
@property (strong,nonatomic) TMPlanCreateViewController *planCreateViewController;

//左上方触发
@property (strong,nonatomic) UIButton *showPlanListBtn;


@end
