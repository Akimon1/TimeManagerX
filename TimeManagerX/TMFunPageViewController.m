//
//  TMFunPageViewController.m
//  TimeManagerX
//
//  Created by yu on 2017/5/31.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMFunPageViewController.h"

@interface TMFunPageViewController ()

@end

@implementation TMFunPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFunPage];
    [self setupButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupFunPage{
    //背景颜色
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(void)setupTopImageView{
    _topImageView = [UIImageView new];
    [self.view addSubview:_topImageView];
    _topImageView.image = [UIImage imageNamed:@"funImageView"];
    _topImageView.sd_layout
    .heightIs(SCREEN_HEIGHT*0.1)
    .widthIs(SCREEN_WIDTH);
}

-(void)setupButton{
    _MYSTUButton = [UIButton new];                  //MYSTU按钮
    [self.view addSubview:_MYSTUButton];
    [_MYSTUButton setTitle:@"MYSTU" forState:UIControlStateNormal];
    [_MYSTUButton setImage:[UIImage imageNamed:@"MYSTU"] forState:UIControlStateNormal];
    _MYSTUButton.sd_layout
    .topSpaceToView(self.view, SCREEN_HEIGHT*0.1)
    .leftSpaceToView(self.view, SCREEN_WIDTH*0.045)
    .heightIs(SCREEN_WIDTH*0.3)
    .widthIs(SCREEN_WIDTH*0.3)
    ;
    
    _netWorkButton = [UIButton new];                //校园网按钮
    [self.view addSubview:_netWorkButton];
    _netWorkButton.sd_layout
    ;
    
    _flowerButton = [UIButton new];                 //郁金香导航按钮
    [self.view addSubview:_flowerButton];
    _flowerButton.sd_layout
    ;
    
    _bilibiliButton = [UIButton new];               //bilibili按钮
    [self.view addSubview:_bilibiliButton];
    _bilibiliButton.sd_layout
    ;
    
    _bingButton = [UIButton new];                   //必应按钮
    [self.view addSubview:_bingButton];
    _bingButton.sd_layout
    ;
    
    _googleButton = [UIButton new];                 //谷歌按钮
    [self.view addSubview:_googleButton];
    _googleButton.sd_layout
    ;
    
    _baiduButton = [UIButton new];                  //百度按钮
    [self.view addSubview:_baiduButton];
    _baiduButton.sd_layout
    ;
    
    _sinaButton = [UIButton new];                   //网易新闻按钮
    [self.view addSubview:_sinaButton];
    _sinaButton.sd_layout
    ;
    
    _airbnbButton = [UIButton new];                 //airbnb按钮
    [self.view addSubview:_airbnbButton];
    _airbnbButton.sd_layout
    ;
    
}

-(void)setupBottomLabel{
    _bottomLabel = [UILabel new];
    [self.view addSubview:_bottomLabel];
    _bottomLabel.text = @"HAVE  FUN!";
    _bottomLabel.sd_layout
    .heightIs(SCREEN_HEIGHT*0.1)
    .widthIs(SCREEN_WIDTH)
    .bottomSpaceToView(self.view, 0);
}

@end
