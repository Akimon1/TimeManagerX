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


- (instancetype) init;
@end
