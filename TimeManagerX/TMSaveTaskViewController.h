//
//  TMSaveTaskViewController.h
//  TimeManagerX
//
//  Created by yu on 2017/6/3.
//  Copyright © 2017年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BmobSDK/BmobObject.h"
#import "BmobSDK/BmobUser.h"
#import "BmobSDK/BmobQuery.h"
#import <CoreLocation/CoreLocation.h>


@interface TMSaveTaskViewController : UIViewController
@property (nonatomic,strong) UITextField *titleTextField;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UILabel *taskDateLabel;
@property (nonatomic,strong) UILabel *startLabel;
@property (nonatomic,strong) UILabel *startTimeLabel;
@property (nonatomic,strong) UILabel *endLabel;
@property (nonatomic,strong) UILabel *endTimeLabel;
@property (nonatomic,strong) UILabel *lastingLabel;
@property (nonatomic,strong) UILabel *lastingTimeLabel;
@property (nonatomic,strong) UILabel *locationLabel;
@property (nonatomic,strong) UITextField *locationTextField;
@property (nonatomic,strong) UIButton *locateButton;
@property (nonatomic,strong) UILabel *memoLabel;
@property (nonatomic,strong) UITextView *memoTextView;
@property  NSString *getPassNowDate;
@property  NSString *getPassNowTime;
@property  NSString *getLastTime;
@property (nonatomic,strong) UIBarButtonItem *rightButton;
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) NSString *currentCity; //当前城市 xx市
@property (nonatomic,strong) NSString *currentLocation; //当前具体地址 xx市xx区xx街道
@end
