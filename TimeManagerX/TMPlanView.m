//
//  TMPlanView.m
//  TimeManagerX
//
//  Created by djwang on 2017/6/3.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMPlanView.h"

@implementation TMPlanView

-(instancetype) init{
    self = [super init];
    if(self){
        [self setupCircle];
        [self setupPlanNameLabel];
        [self setupStartTimeLabel];
        [self initData];

    }
    return self;
}



-(void)setupCircle
{
    CGFloat margin = SCREEN_WIDTH / 6;
    CGFloat circleWidth = SCREEN_WIDTH - margin * 2;

    _circle = [[XLCircleProgress alloc] initWithFrame:CGRectMake(0, 0,circleWidth,circleWidth)];
    [self addSubview:_circle];

    _circle.sd_layout
    .topSpaceToView(self, SCREEN_HEIGHT*0.05)
    .centerXIs(SCREEN_WIDTH/2);
    NSLog(@"setupCircle");
}

-(void)setupPlanNameLabel {
    CGFloat margin = SCREEN_WIDTH / 6;
    CGFloat circleWidth = SCREEN_WIDTH - margin * 2;
    _planNameLabel = [UILabel new];
    _planNameLabel.font = [UIFont systemFontOfSize:20 weight:2];
    _planNameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_planNameLabel];

    _planNameLabel.sd_layout
    .heightIs(30)
    .widthIs(circleWidth)
    .rightEqualToView(_circle)
    .topSpaceToView(_circle, SCREEN_HEIGHT*0.1);
    NSLog(@"setupPlaneNameLabel");
}

-(void)setupStartTimeLabel {
    CGFloat margin = SCREEN_WIDTH / 6;
    CGFloat circleWidth = SCREEN_WIDTH - margin * 2;
    
    _startTimeLabel = [UILabel new];
    _startTimeLabel.font = [UIFont systemFontOfSize:15 weight:0.6];
    _startTimeLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_startTimeLabel];

    _startTimeLabel.sd_layout
    .heightIs(30)
    .widthIs(circleWidth)
    .topSpaceToView(_planNameLabel, SCREEN_HEIGHT*0.025)
    .rightEqualToView(_circle);
    NSLog(@"setupStartTimeLabel");
}

-(void)initData {
    _planNameLabel.text = @"";
    _startTimeLabel.text = @"";
    NSLog(@"initData");
}




@end
