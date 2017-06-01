//
//  TMLoginView.m
//  TimeManagerX
//
//  Created by djwang on 2017/6/1.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMSignView.h"

@interface TMSignView() <UIScrollViewDelegate, UITextFieldDelegate>

@property (nonatomic,strong) UIScrollView *topScrollView;
@property (nonatomic,strong) UIView *slideView;

@property (nonatomic,strong) UIView *signInView; //登陆View
@property (nonatomic,strong) UIView *signUpView; //注册View
@end

@implementation TMSignView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    
    [self initTopTabs];
    [self initContentScrollView];
    [self initSignInView];
    [self initSignUpView];
    
    return self;
}

#pragma mark -- 上部button相关
- (void) initTopTabs {
    //topMainView - topScrollView - slideView + buttonView
    CGFloat HALFWIDTH = SCREEN_WIDTH / 2;
    CGFloat TOPHEIGHT = 40;
    
    _topMainView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, TOPHEIGHT)];
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
    [_slideView setBackgroundColor:[UIColor redColor]];
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

- (void) touchButton: (id) sender {
    UIButton *button = sender;
    [_contentScrollView setContentOffset:CGPointMake(button.tag * SCREEN_WIDTH, 0) animated:YES];
    
}


#pragma mark -- 下部内容相关
- (void) initContentScrollView {
    _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 140, SCREEN_WIDTH, SCREEN_HEIGHT*0.6)];
    _contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*2, SCREEN_HEIGHT*0.6);
    _contentScrollView.backgroundColor = [UIColor clearColor];
    
    _contentScrollView.pagingEnabled = YES;
    _contentScrollView.delegate = self;
    [self addSubview:_contentScrollView];
    
}

//登录页面的空间都添加到contentScrollView
- (void) initSignInView {
    UILabel *usernameLabel = [UILabel new];
    usernameLabel.text = @"USERNAME";
    usernameLabel.font = [UIFont systemFontOfSize:15];
    usernameLabel.backgroundColor = [UIColor clearColor];
    
    UILabel *passwordLabel = [UILabel new];
    passwordLabel.text = @"PASSWORD";
    passwordLabel.font = [UIFont systemFontOfSize:15];
    passwordLabel.backgroundColor = [UIColor clearColor];
    
    
    UITextField *usernameTextField = [UITextField new];
    usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
    usernameTextField.backgroundColor = [UIColor clearColor];
    usernameTextField.delegate = self;
    
    UITextField *passwordTextField = [UITextField new];
    passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextField.backgroundColor = [UIColor clearColor];
    passwordTextField.secureTextEntry = YES;
    passwordTextField.delegate = self;
    
    UIButton *signInBtn = [UIButton new];
    signInBtn.layer.cornerRadius = 3;
    signInBtn.layer.masksToBounds = YES;
    signInBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [signInBtn setTitle:@"SIGN IN" forState:UIControlStateNormal];
    [signInBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signInBtn setBackgroundColor:[UIColor colorWithRed:27 green:102 blue:234 alpha:0]];
    signInBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;

    [_contentScrollView sd_addSubviews:@[usernameLabel, passwordLabel, usernameTextField, passwordTextField, signInBtn]];
    
    CGFloat widthOfLabel = SCREEN_WIDTH / 3 * 2;
    CGFloat spaceToLeft = (SCREEN_WIDTH - widthOfLabel) / 2;
    
    usernameLabel.sd_layout
    .widthIs(widthOfLabel)
    .autoHeightRatio(0)
    .topSpaceToView(_contentScrollView, 50)
    .leftSpaceToView(_contentScrollView, spaceToLeft + 4);
    
    usernameTextField.sd_layout
    .widthIs(widthOfLabel)
    .heightIs(40)
    .topSpaceToView(usernameLabel, 10)
    .leftSpaceToView(_contentScrollView, spaceToLeft);
    
    passwordLabel.sd_layout
    .widthIs(widthOfLabel)
    .autoHeightRatio(0)
    .topSpaceToView(usernameTextField, 17)
    .leftSpaceToView(_contentScrollView, spaceToLeft + 4);
    
    passwordTextField.sd_layout
    .widthIs(widthOfLabel)
    .heightIs(40)
    .topSpaceToView(passwordLabel, 10)
    .leftSpaceToView(_contentScrollView, spaceToLeft);
    
    signInBtn.sd_layout
    .widthIs(widthOfLabel)
    .heightIs(40)
    .topSpaceToView(passwordTextField, 35)
    .leftSpaceToView(_contentScrollView, spaceToLeft);

}

//注册页面的空间都添加到contentScrollView
- (void) initSignUpView {
    
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

@end
