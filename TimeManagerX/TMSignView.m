//
//  TMLoginView.m
//  TimeManagerX
//
//  Created by djwang on 2017/6/1.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMSignView.h"
#import "TMHomeViewController.h"

@interface TMSignView() <UIScrollViewDelegate, UITextFieldDelegate>

@property (nonatomic,strong) UIScrollView *topScrollView;
@property (nonatomic,strong) UIView *slideView;
@property (nonatomic,strong) UIView *signInView; //登陆View
@property (nonatomic,strong) UIView *signUpView; //注册View
@property (nonatomic,strong) UIViewController *myViewController;

@end

@implementation TMSignView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    
    [self initTopTabs];
    [self initContentScrollView];
    [self initSignInView];
    [self initSignUpView];
    [self configTextFields:@[_usernameTextField, _passwordTextField, _usernameTextField2, _passwordTextField2, _emailTextField2]];
    
    return self;
}

#pragma mark -- 上部button相关
- (void) initTopTabs {
    //topMainView - topScrollView - slideView + buttonView
    CGFloat HALFWIDTH = SCREEN_WIDTH / 2;
    CGFloat TOPHEIGHT = 40;
    
    _topMainView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TOPHEIGHT)];
    _topScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TOPHEIGHT)];
    _topScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, TOPHEIGHT);
    _topScrollView.showsHorizontalScrollIndicator = NO;
    _topScrollView.showsVerticalScrollIndicator = YES;
    _topScrollView.bounces = NO;
    _topScrollView.delegate = self;
    
    [_topMainView setBackgroundColor:[UIColor clearColor]];
    [_topScrollView setBackgroundColor:[UIColor clearColor]];
    
    //这个小横条需要响应操作setContentOffset
    _slideView = [[UIView alloc] initWithFrame:CGRectMake(0, TOPHEIGHT - 3, HALFWIDTH, 3)];
    [_slideView setBackgroundColor:[UIColor blueColor]];
    [_topScrollView addSubview:_slideView];
    
    
    [self addSubview:_topMainView];
    [_topMainView addSubview:_topScrollView];
    
    for(int i = 0; i < 2; i++) {
        UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(i * HALFWIDTH, 0, HALFWIDTH, TOPHEIGHT-3)];
        buttonView.backgroundColor = [UIColor clearColor];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, HALFWIDTH, TOPHEIGHT-3)];
        button.tag = i;
        
        if(i==0) {
            [button setTitle:[NSString stringWithFormat:@"SIGN IN"] forState:UIControlStateNormal];
        }else {
            [button setTitle:[NSString stringWithFormat:@"SIGN UP"] forState:UIControlStateNormal];
        }
        [button setBackgroundColor:[UIColor clearColor]];
        button.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(touchButton:) forControlEvents:UIControlEventTouchUpInside];
        [buttonView addSubview:button];
        
        [_topScrollView addSubview:buttonView];
    }
    
}


#pragma mark -- 下部内容相关
- (void) initContentScrollView {
    _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT*0.6)];
    _contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*2, SCREEN_HEIGHT*0.6);
    _contentScrollView.backgroundColor = [UIColor clearColor];
    _contentScrollView.showsHorizontalScrollIndicator = NO;
    _contentScrollView.pagingEnabled = YES;
    _contentScrollView.delegate = self;
    [self addSubview:_contentScrollView];
}

//登录页面的空间都添加到contentScrollView
- (void) initSignInView {
    CGFloat widthOfLabel = SCREEN_WIDTH / 3 * 2;
    CGFloat spaceToLeft = (SCREEN_WIDTH - widthOfLabel) / 2;
    
    UILabel *usernameLabel = [[UILabel alloc]initWithFrame:CGRectMake(spaceToLeft, 40, widthOfLabel, 30)];
    usernameLabel.text = @"USERNAME";
    usernameLabel.font = [UIFont systemFontOfSize:15];
    usernameLabel.backgroundColor = [UIColor clearColor];
    
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceToLeft, 120, widthOfLabel, 30)];
    passwordLabel.text = @"PASSWORD";
    passwordLabel.font = [UIFont systemFontOfSize:15];
    passwordLabel.backgroundColor = [UIColor clearColor];
    
    
    _usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(spaceToLeft, 70, widthOfLabel, 40)];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(spaceToLeft, 150, widthOfLabel, 40)];
    _passwordTextField.secureTextEntry = YES;
    
    _signInBtn = [[UIButton alloc] initWithFrame:CGRectMake(spaceToLeft, 300, widthOfLabel, 40)];
    _signInBtn.layer.cornerRadius = 3;
    _signInBtn.layer.masksToBounds = YES;
    _signInBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [_signInBtn setTitle:@"SIGN IN" forState:UIControlStateNormal];
    [_signInBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_signInBtn setBackgroundColor:[UIColor colorWithRed:27 green:102 blue:234 alpha:0]];
    _signInBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_signInBtn addTarget:self action:@selector(signInWhenTouch:) forControlEvents:UIControlEventTouchUpInside];

    [_contentScrollView sd_addSubviews:@[usernameLabel, passwordLabel, _usernameTextField, _passwordTextField, _signInBtn]];
    
}

- (void) signInWhenTouch :(id) sender{
    if([_signInBtn isEqual:sender]){
        NSString *usernameInField = _usernameTextField.text;
        NSString *passwordInField = _passwordTextField.text;
        [BmobUser loginWithUsernameInBackground:usernameInField password:passwordInField block:^(BmobUser *user, NSError *error) {
            if(user){
                NSLog(@"%@",user);
                //登陆成功跳转页面
                _myViewController = [self getCurrentViewController:self];
                NSLog(@"%@",NSStringFromClass([_myViewController class]));
                TMHomeViewController *homeVC = [TMHomeViewController new];
                [_myViewController presentViewController:homeVC animated:true completion:nil];
                
            }else{
                NSLog(@"login failed");
                //需要继续操作，当前用户不存在／密码不正确。
            }
        }];
    }
}

- (void) signUpWhenTouch :(id) sender{
    if([_signUpBtn isEqual:sender]){
        BmobUser *bUser = [[BmobUser alloc] init];
        [bUser setUsername:_usernameTextField2.text];
        [bUser setPassword:_passwordTextField2.text];
        [bUser setEmail:_emailTextField2.text];
        [bUser signUpInBackgroundWithBlock:^(BOOL isSuccessful, NSError *error){
            if(isSuccessful){
                NSLog(@"signup successed");
            }else{
                NSLog(@"%@",error);
            }
        }];
    }
}

//注册页面的空间都添加到contentScrollView
- (void) initSignUpView {

    //真他妈惨，自动布局在scrollView不可见部分不能使用。要用CGRect一个个填写。
    CGFloat widthOfLabel = SCREEN_WIDTH / 3 * 2;
    CGFloat spaceToLeft = (SCREEN_WIDTH - widthOfLabel) / 2 + SCREEN_WIDTH;
    
    UILabel *usernameLabel = [[UILabel alloc]initWithFrame:CGRectMake(spaceToLeft, 40, widthOfLabel, 30)];
    usernameLabel.text = @"USERNAME";
    usernameLabel.font = [UIFont systemFontOfSize:15];
    usernameLabel.backgroundColor = [UIColor clearColor];
    
    UILabel *passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceToLeft, 120, widthOfLabel, 30)];
    passwordLabel.text = @"PASSWORD";
    passwordLabel.font = [UIFont systemFontOfSize:15];
    passwordLabel.backgroundColor = [UIColor clearColor];
    
    UILabel *emailLabel = [[UILabel alloc] initWithFrame:CGRectMake(spaceToLeft, 200, widthOfLabel, 30)];
    emailLabel.text = @"EMAIL";
    emailLabel.font = [UIFont systemFontOfSize:15];
    emailLabel.backgroundColor = [UIColor clearColor];
    
    _usernameTextField2 = [[UITextField alloc] initWithFrame:CGRectMake(spaceToLeft, 70, widthOfLabel, 40)];

    _passwordTextField2 = [[UITextField alloc] initWithFrame:CGRectMake(spaceToLeft, 150, widthOfLabel, 40)];
    _passwordTextField2.secureTextEntry = YES;
    
    _emailTextField2 = [[UITextField alloc] initWithFrame:CGRectMake(spaceToLeft, 230, widthOfLabel, 40)];
    
    _signUpBtn = [[UIButton alloc] initWithFrame:CGRectMake(spaceToLeft, 300, widthOfLabel, 40)];
    _signUpBtn.layer.cornerRadius = 3;
    _signUpBtn.layer.masksToBounds = YES;
    _signUpBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [_signUpBtn setTitle:@"SIGN UP" forState:UIControlStateNormal];
    [_signUpBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_signUpBtn setBackgroundColor:[UIColor colorWithRed:27 green:102 blue:234 alpha:0]];
    _signUpBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [_signUpBtn addTarget:self action:@selector(signUpWhenTouch:) forControlEvents:UIControlEventTouchUpInside];
    
    [_contentScrollView sd_addSubviews:@[usernameLabel, passwordLabel, emailLabel, _usernameTextField2, _passwordTextField2, _emailTextField2, _signUpBtn]];
}

#pragma mark -- 配置TextField方法
- (void) configTextFields:(NSArray *)textFields {
    for(int i=0; i<textFields.count; i++){
        UITextField *textField = textFields[i];
        textField.delegate = self;
        textField.layer.cornerRadius = 15;
        textField.layer.masksToBounds = YES;
        textField.layer.borderWidth = 1.0f;
        textField.backgroundColor = [UIColor clearColor];
        textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 0)];
        //设置显示模式为永远显示(默认不显示)
        textField.leftViewMode = UITextFieldViewModeAlways;
    }
}


#pragma mark -- 事件方法
- (void) touchButton: (id) sender {
    UIButton *button = sender;
    [_contentScrollView setContentOffset:CGPointMake(button.tag * SCREEN_WIDTH, 0) animated:YES];
}

#pragma mark -- scrollView代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if([_contentScrollView isEqual:scrollView]){
        CGRect frame = _slideView.frame;
        frame.origin.x = scrollView.contentOffset.x / 2;
        _slideView.frame = frame;
    }
}

#pragma mark -- textField代理方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (UIViewController *)getCurrentViewController:(UIView *) currentView
{
    for (UIView* next = [currentView superview]; next; next = next.superview)
    {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
