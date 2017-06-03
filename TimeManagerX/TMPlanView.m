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
        [self setupTimer];
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

-(void)setupTimer{
    _dateTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(dateDisplay) userInfo:nil repeats:YES];
    _timeTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timeDisplay) userInfo:nil repeats:YES];
    _dateLabel = [UILabel new];
    [self addSubview:_dateLabel];
    _dateLabel.sd_layout
    .heightIs(SCREEN_HEIGHT*0.1)
    .widthIs(SCREEN_WIDTH*0.6)
    .bottomSpaceToView(_circle, SCREEN_HEIGHT*0.025)
    .leftSpaceToView(self, SCREEN_WIDTH*0.2);
    
    _timeLabel = [UILabel new];
    [self addSubview:_timeLabel];
    _timeLabel.sd_layout
    .heightIs(SCREEN_HEIGHT*0.1)
    .widthIs(SCREEN_WIDTH*0.6)
    .topSpaceToView(_startTimeLabel, SCREEN_HEIGHT*0.025)
    .leftSpaceToView(self, SCREEN_WIDTH*0.2);
    
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
    //模拟数据
    NSDictionary *dataSource = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"雅思托福",@"planName",
                                @"2017/6/1 开始",@"startTime"
                                , nil];

    _planNameLabel.text = dataSource[@"planName"];
    _startTimeLabel.text = dataSource[@"startTime"];
    NSLog(@"initData");
}

- (void)dateDisplay {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"YYYY年MM月dd日\n"];
    NSString *dateNow = [dateFormatter stringFromDate:[NSDate date]];
    dateNow = [dateNow stringByAppendingString:[self getWeekdayFromDate:[NSDate date]]];
    [_dateLabel setText:dateNow];
    [_dateLabel setTextAlignment : NSTextAlignmentCenter];
    _dateLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:22];
    _dateLabel.layer.cornerRadius = SCREEN_HEIGHT*0.05;
    _dateLabel.clipsToBounds = YES;
    _dateLabel.numberOfLines = 0;
    _dateLabel.layer.borderColor = [[UIColor grayColor]CGColor];
    _dateLabel.layer.borderWidth = 0.5f;
    _dateLabel.layer.masksToBounds = YES;
}

- (void)timeDisplay {
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc]init];
    [timeFormatter setDateFormat:@"HH:mm:ss"];
    NSString *timeNow = [timeFormatter stringFromDate:[NSDate date]];
    
    [_timeLabel setText:timeNow];
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    _timeLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:28];
    _timeLabel.layer.cornerRadius = SCREEN_HEIGHT*0.05;
    _timeLabel.clipsToBounds = YES;
    _timeLabel.layer.borderColor = [[UIColor grayColor]CGColor];
    _timeLabel.layer.borderWidth = 0.5f;
    _timeLabel.layer.masksToBounds = YES;
}

- (NSString *)getWeekdayFromDate:(NSDate *)date {
    NSArray *weekday = [NSArray arrayWithObjects:@"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [calendar components:NSCalendarUnitWeekday fromDate:date];
    return [weekday objectAtIndex:([comps weekday]-1)];
}


@end
