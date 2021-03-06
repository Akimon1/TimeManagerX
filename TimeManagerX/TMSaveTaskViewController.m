//
//  TMSaveTaskViewController.m
//  TimeManagerX
//
//  Created by yu on 2017/6/3.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMSaveTaskViewController.h"
#import "TMHomeViewController.h"

@interface TMSaveTaskViewController ()<CLLocationManagerDelegate>
@property (nonatomic,strong) TMHomeViewController *homeViewController;
@end

@implementation TMSaveTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTheRightButton];
    [self setupSaveTask];
    [self setupTitleTextField];
    [self setupDate];
    [self setupStartAndEndTime];
    [self setupLastingTime];
    [self setupLocation];
    [self setupMemo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)setupSaveTask{
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)setupTitleTextField{
    _titleTextField = [UITextField new];
    [self.view addSubview:_titleTextField];
    _titleTextField.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    _titleTextField.font = [UIFont fontWithName:@"Arial-BoldMT" size:35];
    _titleTextField.textAlignment = NSTextAlignmentCenter;
    _titleTextField.placeholder = @"请输入任务标题";
    _titleTextField.layer.borderColor = [[UIColor colorWithRed:215.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
    _titleTextField.layer.borderWidth = 0.6f;
    _titleTextField.layer.cornerRadius = 6.0f;
    _titleTextField.sd_layout
    .widthIs(SCREEN_WIDTH*0.9)
    .heightIs(SCREEN_HEIGHT*0.1)
    .topSpaceToView(self.navigationController.navigationBar, SCREEN_HEIGHT*0.05)
    .centerXIs(SCREEN_WIDTH/2)
    ;
}
-(void)setupDate{
    _dateLabel = [UILabel new];
    [self.view addSubview:_dateLabel];
    _dateLabel.text = @"任务日期：";
    _dateLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    _dateLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    _dateLabel.sd_layout
    .leftSpaceToView(self.view, SCREEN_WIDTH*0.05)
    .topSpaceToView(_titleTextField, SCREEN_WIDTH*0.05)
    .widthIs(SCREEN_WIDTH*0.3)
    .heightIs(SCREEN_HEIGHT*0.07);
    
    _taskDateLabel = [UILabel new];
    [self.view addSubview:_taskDateLabel];
    _taskDateLabel.text =_getPassNowDate;
    _taskDateLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    _taskDateLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    _taskDateLabel.sd_layout
    .leftSpaceToView(_dateLabel, SCREEN_WIDTH*0.05)
    .centerYEqualToView(_dateLabel)
    .widthIs(SCREEN_WIDTH*0.6)
    .autoHeightRatio(0);
}

-(void)setupStartAndEndTime{
    _startLabel = [UILabel new];
    [self.view addSubview:_startLabel];
    _startLabel.text = @"开始时间：";
    _startLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    _startLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    _startLabel.sd_layout
    .leftEqualToView(_dateLabel)
    .topSpaceToView(_dateLabel, SCREEN_WIDTH*0.05)
    .widthIs(SCREEN_WIDTH*0.3)
    .heightIs(SCREEN_HEIGHT*0.07);
    
    _startTimeLabel = [UILabel new];
    [self.view addSubview:_startTimeLabel];
    _startTimeLabel.text = _getPassNowTime;
    _startTimeLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    _startTimeLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    _startTimeLabel.sd_layout
    .leftSpaceToView(_startLabel, SCREEN_WIDTH*0.05)
    .centerYEqualToView(_startLabel)
    .widthIs(SCREEN_WIDTH*0.6)
    .autoHeightRatio(0);
    
    _endLabel = [UILabel new];
    [self.view addSubview:_endLabel];
    _endLabel.text = @"结束时间：";
    _endLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    _endLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    _endLabel.sd_layout
    .leftEqualToView(_dateLabel)
    .topSpaceToView(_startLabel, SCREEN_WIDTH*0.05)
    .widthIs(SCREEN_WIDTH*0.3)
    .heightIs(SCREEN_HEIGHT*0.07);
    
    _endTimeLabel = [UILabel new];
    [self.view addSubview:_endTimeLabel];
    NSDateFormatter *timeFormatter = [[NSDateFormatter alloc]init];
    [timeFormatter setDateFormat:@"HH:mm:ss"];
    NSString *endTime = [timeFormatter stringFromDate:[NSDate date]];
    _endTimeLabel.text = endTime;
    _endTimeLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    _endTimeLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    _endTimeLabel.sd_layout
    .leftSpaceToView(_endLabel, SCREEN_WIDTH*0.05)
    .centerYEqualToView(_endLabel)
    .widthIs(SCREEN_WIDTH*0.6)
    .autoHeightRatio(0);
}

-(void)setupLastingTime{
    _lastingLabel = [UILabel new];
    [self.view addSubview:_lastingLabel];
    _lastingLabel.text = @"持续时间：";
    _lastingLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    _lastingLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    _lastingLabel.sd_layout
    .leftEqualToView(_dateLabel)
    .topSpaceToView(_endLabel, SCREEN_WIDTH*0.05)
    .widthIs(SCREEN_WIDTH*0.3)
    .heightIs(SCREEN_HEIGHT*0.07);
    
    _lastingTimeLabel = [UILabel new];
    [self.view addSubview:_lastingTimeLabel];
    _lastingTimeLabel.text = _getLastTime;
    _lastingTimeLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    _lastingTimeLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    _lastingTimeLabel.sd_layout
    .leftSpaceToView(_lastingLabel, SCREEN_WIDTH*0.05)
    .centerYEqualToView(_lastingLabel)
    .widthIs(SCREEN_WIDTH*0.6)
    .autoHeightRatio(0);
}

-(void)setupLocation{
    _locationLabel = [UILabel new];
    [self.view addSubview:_locationLabel];
    _locationLabel.text = @"任务地点：";
    _locationLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    _locationLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    _locationLabel.sd_layout
    .leftEqualToView(_dateLabel)
    .topSpaceToView(_lastingLabel, SCREEN_WIDTH*0.05)
    .widthIs(SCREEN_WIDTH*0.3)
    .heightIs(SCREEN_HEIGHT*0.07);
    
    _locateButton = [UIButton new];
    [_locateButton setTitle:@"获取定位" forState:UIControlStateNormal];
    [_locateButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _locateButton.titleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    _locateButton.layer.cornerRadius = SCREEN_HEIGHT*0.035;
    _locateButton.layer.masksToBounds = YES;
    [_locateButton setBackgroundColor:[UIColor colorWithRed:152/255.0 green:245/255.0 blue:255/255.0 alpha:1]];
    [_locateButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];      //设置title在button被选中情况下为灰色字体
    [self.view addSubview:_locateButton];
    [_locateButton addTarget:self action:@selector(toGetLocation) forControlEvents:UIControlEventTouchUpInside];
    _locateButton.sd_layout
    .heightIs(SCREEN_HEIGHT*0.07)
    .widthIs(SCREEN_WIDTH*0.3)
    .rightSpaceToView(self.view, SCREEN_WIDTH*0.05)
    .centerYEqualToView(_locationLabel);
    
    _locationTextField = [UITextField new];
    [self.view addSubview:_locationTextField];
    _locationTextField.placeholder = @"请输入地点";
    _locationTextField.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    _locationTextField.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    _locationTextField.textAlignment = NSTextAlignmentCenter;
    _locationTextField.layer.borderColor = [[UIColor colorWithRed:215.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
    _locationTextField.layer.borderWidth = 0.6f;
    _locationTextField.layer.cornerRadius = 6.0f;
    _locationTextField.sd_layout
    .leftEqualToView(_locationLabel)
    .topSpaceToView(_locationLabel, SCREEN_HEIGHT*0.01)
    .widthIs(SCREEN_WIDTH*0.9)
    .heightIs(SCREEN_HEIGHT*0.05);
}

-(void)setupMemo{
    _memoLabel = [UILabel new];
    [self.view addSubview:_memoLabel];
    _memoLabel.text = @"备注";
    _memoLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    _memoLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    _memoLabel.textAlignment = NSTextAlignmentCenter;
    _memoLabel.sd_layout
    .centerXIs(self.view.width/2)
    .topSpaceToView(_locationTextField, SCREEN_WIDTH*0.03)
    .widthIs(SCREEN_WIDTH*0.2)
    .heightIs(SCREEN_HEIGHT*0.06);
    
    _memoTextView = [UITextView new];
    [self.view addSubview:_memoTextView];
    _memoTextView.text = @"";
    _memoTextView.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
    _memoTextView.font = [UIFont fontWithName:@"Arial-BoldMT" size:15];
    _memoTextView.backgroundColor = [UIColor whiteColor];
    _memoTextView.layer.borderColor = [[UIColor colorWithRed:215.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
    _memoTextView.layer.borderWidth = 0.6f;
    _memoTextView.layer.cornerRadius = 6.0f;
    _memoTextView.sd_layout
    .topSpaceToView(_memoLabel, SCREEN_WIDTH*0.02)
    .centerXEqualToView(_memoLabel)
    .widthIs(SCREEN_WIDTH*0.9)
    .heightIs(SCREEN_HEIGHT*0.1);
}

-(void)setTheRightButton{                                                                     //设置导航栏右按钮
    _rightButton = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"finish32"] style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = _rightButton;
}
-(void)rightAction{
    //往task表添加一条task_name,task_from,task_to,task_location的数据
    BmobObject *newTask = [BmobObject objectWithClassName:@"task"];
    
    //将数据与用户连接
    BmobUser *bmobUser = [BmobUser currentUser];
    if(bmobUser){
        [newTask setObject:bmobUser.username      forKey:@"user_Name"];     //user
        
        [newTask setObject:_titleTextField.text      forKey:@"task_Name"];     //taskName input
        [newTask setObject:_startTimeLabel.text         forKey:@"task_From"];     //timeA
        [newTask setObject:_endTimeLabel.text         forKey:@"task_To"];       //timeB
        [newTask setObject:_lastingTimeLabel.text      forKey:@"task_Time"];     //taskTime
        [newTask setObject:_taskDateLabel.text             forKey:@"task_Date"];     //taskDate
        [newTask setObject:_locationTextField.text  forKey:@"task_Location"]; //taskLocation input
        [newTask setObject:_memoTextView.text   forKey:@"task_Remarks"];  //taskRemarks
        
        
        [newTask saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
            if (isSuccessful) {
                //创建成功后会返回objectId，updatedAt，createdAt等信息
                //创建对象成功，打印对象值
                NSLog(@"%@",newTask);
                [KVNProgress showSuccessWithStatus:@"任务已保存"];
                _homeViewController = [TMHomeViewController new];
                [self presentViewController:_homeViewController animated:true completion:nil];
            } else if (error){
                //发生错误后的动作
                NSLog(@"%@",error);
                [KVNProgress showErrorWithStatus:@"保存失败，遇到了不可预知的意外呢。\n（请检查网络连接。）"];
            } else {
                NSLog(@"Unknow error");
            }
        }];
    }else{
        //缓存用户对象为空时， 可打开用户注册界面…
    }

}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

-(void) toGetLocation{
    [self locate];
}


- (void)locate {
    //判断定位功能是否打开
    if ([CLLocationManager locationServicesEnabled]) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        [_locationManager requestAlwaysAuthorization];
        _currentCity = [[NSString alloc] init];
        [_locationManager startUpdatingLocation];
    }
}

#pragma mark CoreLocation delegate

//定位失败则执行此代理方法
//定位失败弹出提示框,点击"打开定位"按钮,会打开系统的设置,提示打开定位服务
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"允许\"定位\"提示" message:@"请在设置中打开定位" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"打开定位" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开定位设置
        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:settingsURL];
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:cancel];
    [alertVC addAction:ok];
    [self presentViewController:alertVC animated:YES completion:nil];
    
}
//定位成功
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    [_locationManager stopUpdatingLocation];
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
    
    //反编码
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placeMark = placemarks[0];
            _currentCity = placeMark.locality;
            _currentLocation = placeMark.name;
            if (!_currentCity) {
                _currentCity = @"无法定位当前城市";
            }
            NSLog(@"%@",_currentCity); //这就是当前的城市
            NSLog(@"%@",_currentLocation);//具体地址:  xx市xx区xx街道
            self.locationTextField.text = _currentLocation;
            if(_currentLocation){
                [KVNProgress showSuccessWithStatus:@"获取当前位置成功！"];
            }else{
                [KVNProgress showErrorWithStatus:@"获取失败，请稍后再试！"];
            }
        }
        else if (error == nil && placemarks.count == 0) {
            NSLog(@"No location and error return");
        }
        else if (error) {
            NSLog(@"location error: %@ ",error);
        }
        
    }];
}


@end
