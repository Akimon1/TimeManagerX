//
//  TMPlanView.h
//  TimeManagerX
//
//  Created by djwang on 2017/6/3.
//  Copyright © 2017年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "XLCircleProgress.h"
@interface TMPlanView : UIView

//圆形进度图
@property (strong,nonatomic) XLCircleProgress *circle;

@property (strong,nonatomic) UILabel *planNameLabel;
@property (strong,nonatomic) UILabel *startTimeLabel;

@property (strong, nonatomic)  UILabel *dateLabel;
@property (strong, nonatomic)  UILabel *timeLabel;
@property (strong, nonatomic)  NSTimer *dateTimer;
@property (strong, nonatomic)  NSTimer *timeTimer;
- (instancetype) init;
@end
