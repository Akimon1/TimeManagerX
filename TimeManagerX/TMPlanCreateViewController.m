//
//  TMPlanCreateViewController.m
//  TimeManagerX
//
//  Created by djwang on 2017/6/3.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMPlanCreateViewController.h"
#import "TMPlanCreateCell.h"
#import "TMHomeViewController.h"
@interface TMPlanCreateViewController () <UITabBarDelegate,UITextFieldDelegate>

@property (nonatomic,strong) UIBarButtonItem *finishBtn;
@property (nonatomic,strong) NSString *planName;
@property (nonatomic,strong) NSString *planTime;
@property (nonatomic,strong) NSString *planMotto;

@property (nonatomic,strong) UILabel *planNameLabel;
@property (nonatomic,strong) UILabel *planTimeLabel;
@property (nonatomic,strong) UILabel *planMottoLabel;

@property (nonatomic,strong) UITextField *planNameTextField;
@property (nonatomic,strong) UITextField *planTimeTextField;
@property (nonatomic,strong) UITextField *planMottoTextField;


@end

@implementation TMPlanCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"创建计划";
    [self setupPlanName];
    [self setupPlanTime];
    [self setupPlanMotto];
    [self setupFinishBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setupPlanName{
    _planNameLabel = [UILabel new];
    [self.view addSubview:_planNameLabel];
    _planNameLabel.text = @"计划项目";
    _planNameLabel.textAlignment = NSTextAlignmentCenter;
    _planNameLabel.textColor = [UIColor grayColor];
    _planNameLabel.backgroundColor = [UIColor whiteColor];
    _planNameLabel.sd_layout
    .leftSpaceToView(self.view, 20)
    .topSpaceToView(self.navigationController.navigationBar, 30)
    .widthIs(80)
    .heightIs(40);
    
     _planNameTextField = [UITextField new];
    [self.view addSubview:_planNameTextField];
    _planNameTextField.placeholder = @"学外语，弹吉他";
    _planNameTextField.textAlignment = NSTextAlignmentCenter;
    UIView *paddingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    _planNameTextField.leftView = paddingView;
    _planNameTextField.leftViewMode = UITextFieldViewModeAlways;
    _planNameTextField.backgroundColor = [UIColor whiteColor];
    _planNameTextField.sd_layout
    .topSpaceToView(self.navigationController.navigationBar, 30)
    .leftSpaceToView(_planNameLabel, 5)
    .rightSpaceToView(self.view, 20)
    .heightIs(40);
    
    
}

-(void) setupPlanTime{
    _planTimeLabel = [UILabel new];
    [self.view addSubview:_planTimeLabel];
    _planTimeLabel.text = @"目标时间";
    _planTimeLabel.textAlignment = NSTextAlignmentCenter;
    _planTimeLabel.textColor = [UIColor grayColor];
    _planTimeLabel.backgroundColor = [UIColor whiteColor];
    _planTimeLabel.sd_layout
    .leftSpaceToView(self.view, 20)
    .topSpaceToView(_planNameLabel, 20)
    .widthIs(80)
    .heightIs(40);
    
    _planTimeTextField = [UITextField new];
    [self.view addSubview:_planTimeTextField];
    _planTimeTextField.delegate = self;
    _planTimeTextField.placeholder = @"10000";
    _planTimeTextField.textAlignment = NSTextAlignmentCenter;
    _planMottoTextField.keyboardType = UIKeyboardTypeNumberPad;
    UIView *paddingView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    _planTimeTextField.leftView = paddingView;
    _planTimeTextField.leftViewMode = UITextFieldViewModeAlways;
    _planTimeTextField.backgroundColor = [UIColor whiteColor];
    _planTimeTextField.sd_layout
    .topSpaceToView(_planNameTextField, 20)
    .leftSpaceToView(_planTimeLabel, 5)
    .rightSpaceToView(self.view, 20)
    .heightIs(40);
}

-(void) setupPlanMotto{
    _planMottoLabel = [UILabel new];
    [self.view addSubview:_planMottoLabel];
    _planMottoLabel.text = @"激励语句";
    _planMottoLabel.textAlignment = NSTextAlignmentCenter;
    _planMottoLabel.textColor = [UIColor grayColor];
    _planMottoLabel.backgroundColor = [UIColor whiteColor];
    _planMottoLabel.sd_layout
    .leftSpaceToView(self.view, 20)
    .topSpaceToView(_planTimeLabel, 20)
    .widthIs(80)
    .heightIs(40);
    
    _planMottoTextField = [UITextField new];
    [self.view addSubview:_planMottoTextField];
    _planMottoTextField.placeholder = @"让优秀成为一种习惯";
    _planMottoTextField.textAlignment = NSTextAlignmentCenter;
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    _planMottoTextField.leftView = paddingView;
    _planMottoTextField.leftViewMode = UITextFieldViewModeAlways;
    _planMottoTextField.backgroundColor = [UIColor whiteColor];
    _planMottoTextField.sd_layout
    .leftSpaceToView(_planMottoLabel, 5)
    .topSpaceToView(_planTimeTextField, 20)
    .rightSpaceToView(self.view, 20)
    .heightIs(40);
    
}


-(void)setupFinishBtn {
    _finishBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"finish32"] style:UIBarButtonItemStylePlain target:self action:@selector(finishEdit:)];
    self.navigationItem.rightBarButtonItem = _finishBtn;
}

-(void)finishEdit:(id)sender {
    if([_finishBtn isEqual:sender]){
        BmobObject *newPlan = [BmobObject objectWithClassName:@"plan"];
        //将数据与用户连接
        BmobUser *bmobUser = [BmobUser currentUser];
        if(bmobUser){
            [newPlan setObject:bmobUser.username      forKey:@"user_Name"];     //user
            
            [newPlan setObject:_planNameTextField.text                      forKey:@"plan_Name"];
            [newPlan setObject:_planTimeTextField.text                      forKey:@"plan_time"];
            [newPlan setObject:_planMottoTextField.text                     forKey:@"plan_motto"];
            [newPlan setObject:@(0)                                         forKey:@"plan_pain"];

            NSLog(@"planMotto is %@", [self planMotto]);
            NSLog(@"planName is%@", [self planName]);
            [newPlan saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
                if (isSuccessful) {
                    //创建成功后会返回objectId，updatedAt，createdAt等信息
                    //创建对象成功，打印对象值
                    NSLog(@"%@",newPlan);
                    [KVNProgress showSuccessWithStatus:@"计划已创建"];
                    [self presentViewController:[TMHomeViewController new] animated:true completion:nil];
                } else if (error){
                    //发生错误后的动作
                    NSLog(@"%@",error);
                    [KVNProgress showErrorWithStatus:@"保存失败，遇到了不可预知的意外呢。"];
                } else {
                    NSLog(@"Unknow error");
                }
            }];
        }else{
            //缓存用户对象为空时， 可打开用户注册界面…
        }
    }
}

#pragma mark --UITextField委托方法
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    //限制_planTimeTextField只能输入数字
    if(_planTimeTextField == textField){
        NSCharacterSet *cs;
        cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
        NSString *filtered =
        [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL basic = [string isEqualToString:filtered];
        return basic;
    }
    return NO;
}


@end
