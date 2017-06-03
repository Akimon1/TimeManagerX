//
//  TMPresentTaskViewController.h
//  TimeManagerX
//
//  Created by yu on 2017/6/3.
//  Copyright © 2017年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMSaveTaskViewController.h"
#import "XLCircleProgress.h"
#import "MZTimerLabel.h"
@interface TMPresentTaskViewController : UIViewController{
    MZTimerLabel *stopWatch;
    Boolean isRunning;
}

@property (nonatomic,strong) UIBarButtonItem *leftButton;
@property (nonatomic,strong) UIBarButtonItem *rightButton;
@property (nonatomic,strong) UIAlertController *alertController;
@property (nonatomic,strong) TMSaveTaskViewController *saveTaskViewController;
@property (nonatomic,strong)  UILabel *dateLabel;
@property (nonatomic,strong)  UILabel *timeLabel;
@property (nonatomic,strong)  NSTimer *dateTimer;
@property (nonatomic,strong)  NSTimer *timeTimer;
//圆形图
@property (nonatomic,strong)  XLCircleProgress *circle;

@property (nonatomic,strong) UILabel *countLabel;
@property (nonatomic,strong) UIButton *stateButton;
@property (nonatomic,strong) NSString *nowTime;

@end
