//
//  CircleView.h
//  YKL
//
//  Created by Apple on 15/12/7.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLCircle.h"
@interface XLCircleProgress : UIView
//百分比
@property (assign,nonatomic) float progress;

//总时间(hours)
@property (assign,nonatomic) int totalTime;

@property (nonatomic,strong) XLCircle *circle;
@property (nonatomic,strong) UILabel *percentLabel;
@property (nonatomic,strong) UILabel *totalTimeLabel;

@end
