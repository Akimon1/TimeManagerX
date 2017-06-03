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
@property (strong, nonatomic)  UILabel *dateLabel;
@property (strong, nonatomic)  UILabel *timeLabel;
@property (strong, nonatomic)  NSTimer *dateTimer;
@property (strong, nonatomic)  NSTimer *timeTimer;
//圆形图
@property (strong, nonatomic)  XLCircleProgress *circle;

@property (strong, nonatomic) UILabel *countLabel;
@property (strong, nonatomic) UIButton *stateButton;
@property (strong, nonatomic) NSString *nowTime;

@end
