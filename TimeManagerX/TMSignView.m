//
//  TMLoginView.m
//  TimeManagerX
//
//  Created by djwang on 2017/6/1.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMSignView.h"

@interface TMSignView() <UIScrollViewDelegate>


@property (nonatomic,strong) UIScrollView *topScrollView;
@property (nonatomic,strong) UIView *slideView;

@property (nonatomic,strong) UIView *signInView; //登陆View
@property (nonatomic,strong) UIView *signUpView; //注册View
@end

@implementation TMSignView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(!self) {
        [self initTopTabs];
        [self initContentScrollView];
        [self initSignInView];
        [self initSignUpView];
    }
    return self;
}

#pragma mark 上部button相关
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
    

    _slideView = [[UIView alloc] initWithFrame:CGRectMake(0, TOPHEIGHT - 3, HALFWIDTH, 3)];
    [_slideView setBackgroundColor:[UIColor blueColor]];
    [_topScrollView addSubview:_slideView];
    
    
    [self addSubview:_topMainView];
    [_topMainView addSubview:_topScrollView];
    
    for(int i = 0; i < 2; i++) {
        UIView *buttonView = [[UIView alloc] initWithFrame:CGRectMake(i * HALFWIDTH, 0, HALFWIDTH, TOPHEIGHT)];
        buttonView.backgroundColor = [UIColor whiteColor];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, HALFWIDTH, TOPHEIGHT)];
        button.tag = i;
        
        if(i==0) {
            [button setTitle:[NSString stringWithFormat:@"SIGN IN"] forState:UIControlStateNormal];
        }else {
            [button setTitle:[NSString stringWithFormat:@"SIGN UP"] forState:UIControlStateNormal];
        }
        
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


#pragma mark 下部内容相关
- (void) initContentScrollView {
    _contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 140, SCREEN_WIDTH, SCREEN_HEIGHT*0.6)];
    _contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH*2, SCREEN_HEIGHT*0.6);
    _contentScrollView.backgroundColor = [UIColor whiteColor];
    
    _contentScrollView.pagingEnabled = YES;
    _contentScrollView.delegate = self;
    [self addSubview:_contentScrollView];
    
}

- (void) initSignInView {
    UILabel *usernameLabel = [UILabel new];
    usernameLabel.text = @"USERNAME";
    
    UILabel *passwordLabel = [UILabel new];
    passwordLabel.text = @"PASSWORD";
    
    UITextField *usernameTextField = [UITextField new];
    
    
    UITextField *passwordTextField = [UITextField new];
    
    
    UIButton *signInBtn = [UIButton new];
    signInBtn.titleLabel.text = @"SIGN IN";
    
    [_contentScrollView sd_addSubviews:@[usernameLabel, passwordLabel, usernameTextField, passwordTextField, signInBtn]];
    
    CGFloat widthOfLabel = SCREEN_WIDTH / 3 * 2;
    CGFloat spaceToLeft = (SCREEN_WIDTH - widthOfLabel) / 2;
    
    usernameLabel.sd_layout
    .widthIs(60)
    .heightIs(15)
    .topSpaceToView(_contentScrollView, 20)
    .leftSpaceToView(_contentScrollView, spaceToLeft + 4);
    
    usernameTextField.sd_layout
    .widthIs(widthOfLabel)
    .heightIs(30)
    .topSpaceToView(usernameLabel, 6)
    .leftSpaceToView(_contentScrollView, spaceToLeft);
    
    passwordLabel.sd_layout
    .widthIs(60)
    .heightIs(15)
    .topSpaceToView(usernameTextField, 6)
    .leftSpaceToView(_contentScrollView, spaceToLeft + 4);
    
    passwordTextField.sd_layout
    .widthIs(widthOfLabel)
    .heightIs(30)
    .topSpaceToView(passwordLabel, 6)
    .leftSpaceToView(_contentScrollView, spaceToLeft);
    
    signInBtn.sd_layout
    .widthIs(widthOfLabel)
    .heightIs(30)
    .topSpaceToView(passwordTextField, 35)
    .leftSpaceToView(_contentScrollView, spaceToLeft);

}

- (void) initSignUpView {
//    CGFloat xInScrollView = SCREEN_WIDTH * 1;
//    
//    CGFloat widthOfLabel = SCREEN_WIDTH / 3 * 2;
//    CGFloat spaceToRight = (SCREEN_WIDTH - widthOfLabel) / 2;
//
}



@end
