//
//  TMPresentTaskViewController.m
//  TimeManagerX
//
//  Created by yu on 2017/6/3.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMPresentTaskViewController.h"
#import "TMHomeViewController.h"

@interface TMPresentTaskViewController ()
@property (nonatomic,strong) TMHomeViewController *homeViewVontroller;
@end

@implementation TMPresentTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupPresentTask];
    [self setTheLeftButton];
    [self setTheRightButton];
    [self setupTimer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)setupPresentTask{
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)setTheLeftButton{                                                                     //设置导航栏左按钮
    _leftButton = [[UIBarButtonItem alloc]initWithTitle:@"放弃任务" style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    self.navigationItem.leftBarButtonItem = _leftButton;
}
-(void)leftAction{
    _alertController = [UIAlertController alertControllerWithTitle:@"放弃任务？" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        _homeViewVontroller = [TMHomeViewController new];
        [self presentViewController:_homeViewVontroller animated:true completion:nil];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [_alertController addAction:ok];
    [_alertController addAction:cancel];
    [self presentViewController:_alertController animated:YES completion:nil];
}

-(void)setTheRightButton{                                                                     //设置导航栏右按钮
    _rightButton = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = _rightButton;
}
-(void)rightAction{
    _saveTaskViewController = [TMSaveTaskViewController new];
    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"放弃保存" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationController pushViewController:_saveTaskViewController animated:true];
}

-(void)setupTimer{
    _dateTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(dateDisplay) userInfo:nil repeats:YES];
    _timeTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timeDisplay) userInfo:nil repeats:YES];
    _dateLabel = [UILabel new];
    [self.view addSubview:_dateLabel];
    _dateLabel.sd_layout
    .heightIs(SCREEN_HEIGHT*0.1)
    .widthIs(SCREEN_WIDTH*0.6)
    .topSpaceToView(self, SCREEN_HEIGHT*0.1)
    .leftSpaceToView(self, SCREEN_WIDTH*0.2);
    
    _timeLabel = [UILabel new];
    [self.view addSubview:_timeLabel];
    _timeLabel.sd_layout
    .heightIs(SCREEN_HEIGHT*0.1)
    .widthIs(SCREEN_WIDTH*0.6)
    .topSpaceToView(_dateLabel, SCREEN_HEIGHT*0.025)
    .leftSpaceToView(self, SCREEN_WIDTH*0.2);
    
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
