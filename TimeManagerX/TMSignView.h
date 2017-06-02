//
//  TMLoginView.h
//  TimeManagerX
//
//  Created by djwang on 2017/6/1.
//  Copyright © 2017年 yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMSignView : UIView

@property (nonatomic,strong) UIView *topMainView;
@property (nonatomic,strong) UIScrollView *contentScrollView;

//需要提取数据的空间，登录页面(无后缀表示登录)
@property (nonatomic,strong) UITextField *usernameTextField;
@property (nonatomic,strong) UITextField *passwordTextField;
@property (nonatomic,strong) UIButton *signInBtn;


//需要提取数据的控件，注册页面(2后缀表示注册)
@property (nonatomic,strong) UITextField *usernameTextField2;
@property (nonatomic,strong) UITextField *passwordTextField2;
@property (nonatomic,strong) UITextField *emailTextField2;
@property (nonatomic,strong) UIButton *signUpBtn;

-(instancetype)initWithFrame:(CGRect)frame;

@end
