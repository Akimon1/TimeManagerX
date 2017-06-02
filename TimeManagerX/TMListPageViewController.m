//
//  TMListPageViewController.m
//  TimeManagerX
//
//  Created by yu on 2017/5/31.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMListPageViewController.h"

@interface TMListPageViewController (){
    NSTimer *dateTimer;
    NSTimer *timeTimer;
}

@end

@implementation TMListPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupListPage];
    [self setupTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupListPage{
    //背景颜色
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.title = @"列表";
}
-(void)setupTimer{
    dateTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(dateDisplay) userInfo:nil repeats:YES];
    timeTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timeDisplay) userInfo:nil repeats:YES];
    _dateLabel = [UILabel new];
    [self.view addSubview:_dateLabel];
    _dateLabel.sd_layout
    .heightIs(SCREEN_HEIGHT*0.1)
    .widthIs(SCREEN_WIDTH*0.6)
    .topSpaceToView(self.view, SCREEN_HEIGHT*0.4)
    .leftSpaceToView(self.view, SCREEN_WIDTH*0.2);
    
    _timeLabel = [UILabel new];
    [self.view addSubview:_timeLabel];
    _timeLabel.sd_layout
    .heightIs(SCREEN_HEIGHT*0.1)
    .widthIs(SCREEN_WIDTH*0.6)
    .topSpaceToView(_dateLabel, SCREEN_HEIGHT*0.05)
    .leftSpaceToView(self.view, SCREEN_WIDTH*0.2);

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
