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
    [self setupBackground];
    [self setupFunPage];
    [self setupTopImageView];
    [self setupButton];
    [self setupBottomLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupBackground{
    _backgroundImageView = [UIImageView new];
    _backgroundImageView.image = [UIImage imageNamed:@"登录注册背景.png"];
    [self.view addSubview:_backgroundImageView];
    
    _backgroundImageView.sd_layout
    .spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

-(void)setupFunPage{
    //背景颜色
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

-(void)setupTopImageView{
    _topImageView = [UIImageView new];
    [self.view addSubview:_topImageView];
    _topImageView.backgroundColor = [UIColor clearColor];
    _topImageView.image = [UIImage imageNamed:@"funImageView"];
    _topImageView.sd_layout
    .heightIs(SCREEN_HEIGHT*0.1)
    .widthIs(SCREEN_WIDTH*0.7)
    .topSpaceToView(self.view, SCREEN_HEIGHT*0.15)
    .leftSpaceToView(self.view, SCREEN_WIDTH*0.15);
}

-(void)setupButton{
    
    
    _MYSTUButton = [UIButton new];                  //MYSTU按钮
    [self.view addSubview:_MYSTUButton];
    [_MYSTUButton setTitle:@"MYSTU" forState:UIControlStateNormal];
    [_MYSTUButton setImage:[UIImage imageNamed:@"MYSTU"] forState:UIControlStateNormal];
    _MYSTUButton.titleLabel.textAlignment = NSTextAlignmentCenter; //设置title的字体居中
    _MYSTUButton.titleLabel.font = [UIFont systemFontOfSize:16];//title字体大小
    [_MYSTUButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为黑色字体
    [_MYSTUButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
    _MYSTUButton.imageEdgeInsets = UIEdgeInsetsMake(5,13,21,_MYSTUButton.titleLabel.bounds.size.width);
    _MYSTUButton.titleEdgeInsets = UIEdgeInsetsMake(70, -_MYSTUButton.titleLabel.bounds.size.width-65, 0, 0);
    _MYSTUButton.sd_layout
    .topSpaceToView(self.topImageView, SCREEN_WIDTH*0.025)
    .leftSpaceToView(self.view, SCREEN_WIDTH*0.025)
    .heightIs(SCREEN_WIDTH*0.3)
    .widthIs(SCREEN_WIDTH*0.3)
    ;
    [_MYSTUButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];//给button添加点击事件，action参数中写入事件执行方法
    [_MYSTUButton setTag:1];                    //在button的tag中添加需要传递的参数

    
    _netWorkButton = [UIButton new];                //校园网按钮
    [self.view addSubview:_netWorkButton];
    [_netWorkButton setTitle:@"校园网" forState:UIControlStateNormal];
    [_netWorkButton setImage:[UIImage imageNamed:@"校园网"] forState:UIControlStateNormal];
    _netWorkButton.titleLabel.textAlignment = NSTextAlignmentCenter; //设置title的字体居中
    _netWorkButton.titleLabel.font = [UIFont systemFontOfSize:16];//title字体大小
    [_netWorkButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为黑色字体
    [_netWorkButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
    _netWorkButton.imageEdgeInsets = UIEdgeInsetsMake(5,13,21,_netWorkButton.titleLabel.bounds.size.width);
    _netWorkButton.titleEdgeInsets = UIEdgeInsetsMake(70, -_netWorkButton.titleLabel.bounds.size.width-70, 0, 0);
    _netWorkButton.sd_layout
    .topSpaceToView(self.topImageView, SCREEN_WIDTH*0.025)
    .leftSpaceToView(self.MYSTUButton, SCREEN_WIDTH*0.025)
    .heightIs(SCREEN_WIDTH*0.3)
    .widthIs(SCREEN_WIDTH*0.3)
    ;
    [_netWorkButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];//给button添加点击事件，action参数中写入事件执行方法
    [_netWorkButton setTag:2];                    //在button的tag中添加需要传递的参数
    
    _flowerButton = [UIButton new];                 //郁金香导航按钮
    [self.view addSubview:_flowerButton];
    [_flowerButton setTitle:@"郁金香导航" forState:UIControlStateNormal];
    [_flowerButton setImage:[UIImage imageNamed:@"郁金香"] forState:UIControlStateNormal];
    _flowerButton.titleLabel.textAlignment = NSTextAlignmentCenter; //设置title的字体居中
    _flowerButton.titleLabel.font = [UIFont systemFontOfSize:16];//title字体大小
    [_flowerButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为黑色字体
    [_flowerButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
    _flowerButton.imageEdgeInsets = UIEdgeInsetsMake(5,13,21,_flowerButton.titleLabel.bounds.size.width);
    _flowerButton.titleEdgeInsets = UIEdgeInsetsMake(70, -_flowerButton.titleLabel.bounds.size.width-65, 0, 0);
    _flowerButton.sd_layout
    .topSpaceToView(self.topImageView, SCREEN_WIDTH*0.025)
    .leftSpaceToView(self.netWorkButton, SCREEN_WIDTH*0.025)
    .heightIs(SCREEN_WIDTH*0.3)
    .widthIs(SCREEN_WIDTH*0.3)
    ;
    [_flowerButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];//给button添加点击事件，action参数中写入事件执行方法
    [_flowerButton setTag:3];                    //在button的tag中添加需要传递的参数
    
    _bilibiliButton = [UIButton new];               //bilibili按钮
    [self.view addSubview:_bilibiliButton];
    [_bilibiliButton setTitle:@"bilibili" forState:UIControlStateNormal];
    [_bilibiliButton setImage:[UIImage imageNamed:@"bilibili"] forState:UIControlStateNormal];
    _bilibiliButton.titleLabel.textAlignment = NSTextAlignmentCenter; //设置title的字体居中
    _bilibiliButton.titleLabel.font = [UIFont systemFontOfSize:16];//title字体大小
    [_bilibiliButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为黑色字体
    [_bilibiliButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
    _bilibiliButton.imageEdgeInsets = UIEdgeInsetsMake(5,18,21,_bilibiliButton.titleLabel.bounds.size.width);
    _bilibiliButton.titleEdgeInsets = UIEdgeInsetsMake(70, -_bilibiliButton.titleLabel.bounds.size.width-60, 0, 0);
    _bilibiliButton.sd_layout
    .topSpaceToView(self.MYSTUButton, SCREEN_WIDTH*0.025)
    .leftSpaceToView(self.view, SCREEN_WIDTH*0.025)
    .heightIs(SCREEN_WIDTH*0.3)
    .widthIs(SCREEN_WIDTH*0.3)
    ;
    [_bilibiliButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];//给button添加点击事件，action参数中写入事件执行方法
    [_bilibiliButton setTag:4];                    //在button的tag中添加需要传递的参数
    
    _bingButton = [UIButton new];                   //必应按钮
    [self.view addSubview:_bingButton];
    [_bingButton setTitle:@"必应" forState:UIControlStateNormal];
    [_bingButton setImage:[UIImage imageNamed:@"bing"] forState:UIControlStateNormal];
    _bingButton.titleLabel.textAlignment = NSTextAlignmentCenter; //设置title的字体居中
    _bingButton.titleLabel.font = [UIFont systemFontOfSize:16];//title字体大小
    [_bingButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为黑色字体
    [_bilibiliButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
    _bingButton.imageEdgeInsets = UIEdgeInsetsMake(5,18,21,_bingButton.titleLabel.bounds.size.width);
    _bingButton.titleEdgeInsets = UIEdgeInsetsMake(70, -_bingButton.titleLabel.bounds.size.width-65, 0, 0);
    _bingButton.sd_layout
    .topSpaceToView(self.flowerButton, SCREEN_WIDTH*0.025)
    .leftSpaceToView(self.bilibiliButton, SCREEN_WIDTH*0.025)
    .heightIs(SCREEN_WIDTH*0.3)
    .widthIs(SCREEN_WIDTH*0.3)
    ;
    [_bingButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];//给button添加点击事件，action参数中写入事件执行方法
    [_bingButton setTag:5];                    //在button的tag中添加需要传递的参数
    
    _googleButton = [UIButton new];                 //谷歌按钮
    [self.view addSubview:_googleButton];
    [_googleButton setTitle:@"google" forState:UIControlStateNormal];
    [_googleButton setImage:[UIImage imageNamed:@"Google"] forState:UIControlStateNormal];
    _googleButton.titleLabel.textAlignment = NSTextAlignmentCenter; //设置title的字体居中
    _googleButton.titleLabel.font = [UIFont systemFontOfSize:16];//title字体大小
    [_googleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为黑色字体
    [_bingButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
    _googleButton.imageEdgeInsets = UIEdgeInsetsMake(5,18,21,_googleButton.titleLabel.bounds.size.width);
    _googleButton.titleEdgeInsets = UIEdgeInsetsMake(70, -_googleButton.titleLabel.bounds.size.width-65, 0, 0);
    _googleButton.sd_layout
    .topSpaceToView(self.flowerButton, SCREEN_WIDTH*0.025)
    .leftSpaceToView(self.bingButton, SCREEN_WIDTH*0.025)
    .heightIs(SCREEN_WIDTH*0.3)
    .widthIs(SCREEN_WIDTH*0.3)
    ;
    [_googleButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];//给button添加点击事件，action参数中写入事件执行方法
    [_googleButton setTag:6];                    //在button的tag中添加需要传递的参数
    
    _baiduButton = [UIButton new];                  //百度按钮
    [self.view addSubview:_baiduButton];
    [_baiduButton setTitle:@"百度" forState:UIControlStateNormal];
    [_baiduButton setImage:[UIImage imageNamed:@"baidu"] forState:UIControlStateNormal];
    _baiduButton.titleLabel.textAlignment = NSTextAlignmentCenter; //设置title的字体居中
    _baiduButton.titleLabel.font = [UIFont systemFontOfSize:16];//title字体大小
    [_baiduButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为黑色字体
    [_googleButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
    _baiduButton.imageEdgeInsets = UIEdgeInsetsMake(5,18,21,_baiduButton.titleLabel.bounds.size.width);
    _baiduButton.titleEdgeInsets = UIEdgeInsetsMake(70, -_baiduButton.titleLabel.bounds.size.width-65, 0, 0);
    _baiduButton.sd_layout
    .topSpaceToView(self.bilibiliButton, SCREEN_WIDTH*0.025)
    .leftSpaceToView(self.view, SCREEN_WIDTH*0.025)
    .heightIs(SCREEN_WIDTH*0.3)
    .widthIs(SCREEN_WIDTH*0.3)
    ;
    [_baiduButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];//给button添加点击事件，action参数中写入事件执行方法
    [_baiduButton setTag:7];                    //在button的tag中添加需要传递的参数
    
    _sinaButton = [UIButton new];                   //网易新闻按钮
    [self.view addSubview:_sinaButton];
    [_sinaButton setTitle:@"网易新闻" forState:UIControlStateNormal];
    [_sinaButton setImage:[UIImage imageNamed:@"sina"] forState:UIControlStateNormal];
    _sinaButton.titleLabel.textAlignment = NSTextAlignmentCenter; //设置title的字体居中
    _sinaButton.titleLabel.font = [UIFont systemFontOfSize:16];//title字体大小
    [_sinaButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为黑色字体
    [_baiduButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
    _sinaButton.imageEdgeInsets = UIEdgeInsetsMake(5,13,21,_sinaButton.titleLabel.bounds.size.width);
    _sinaButton.titleEdgeInsets = UIEdgeInsetsMake(70, -_sinaButton.titleLabel.bounds.size.width-65, 0, 0);
    _sinaButton.sd_layout
    .topSpaceToView(self.bingButton, SCREEN_WIDTH*0.025)
    .leftSpaceToView(self.baiduButton, SCREEN_WIDTH*0.025)
    .heightIs(SCREEN_WIDTH*0.3)
    .widthIs(SCREEN_WIDTH*0.3)
    ;
    [_sinaButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];//给button添加点击事件，action参数中写入事件执行方法
    [_sinaButton setTag:8];                    //在button的tag中添加需要传递的参数
    
    _airbnbButton = [UIButton new];                 //airbnb按钮
    [self.view addSubview:_airbnbButton];
    [_airbnbButton setTitle:@"Airbnb" forState:UIControlStateNormal];
    [_airbnbButton setImage:[UIImage imageNamed:@"airbnb"] forState:UIControlStateNormal];
    _airbnbButton.titleLabel.textAlignment = NSTextAlignmentCenter; //设置title的字体居中
    _airbnbButton.titleLabel.font = [UIFont systemFontOfSize:16];//title字体大小
    [_airbnbButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//设置title在一般情况下为黑色字体
    [_airbnbButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
    _airbnbButton.imageEdgeInsets = UIEdgeInsetsMake(5,17,21,_airbnbButton.titleLabel.bounds.size.width);
    _airbnbButton.titleEdgeInsets = UIEdgeInsetsMake(70, -_airbnbButton.titleLabel.bounds.size.width-65, 0, 0);
    _airbnbButton.sd_layout
    .topSpaceToView(self.googleButton, SCREEN_WIDTH*0.025)
    .leftSpaceToView(self.sinaButton, SCREEN_WIDTH*0.025)
    .heightIs(SCREEN_WIDTH*0.3)
    .widthIs(SCREEN_WIDTH*0.3)
    ;
    [_airbnbButton addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];//给button添加点击事件，action参数中写入事件执行方法
    [_airbnbButton setTag:9];                    //在button的tag中添加需要传递的参数
    
}

-(void)setupBottomLabel{
    _bottomLabel = [UILabel new];
    [self.view addSubview:_bottomLabel];
    _bottomLabel.backgroundColor = [UIColor clearColor];
    _bottomLabel.text = @"HAVE  FUN!";
    _bottomLabel.textAlignment = NSTextAlignmentCenter; //字体居中
    _bottomLabel.font = [UIFont systemFontOfSize:16];//字体大小
    _bottomLabel.sd_layout
    .heightIs(SCREEN_HEIGHT*0.1)
    .widthIs(SCREEN_WIDTH)
    .bottomSpaceToView(self.view, 0);
}

-(void)btnAction:(UIButton *)sender{
    int i=[sender tag];
    switch (i) {
        case 1:
            NSLog(@"1");
            _url = [NSURL URLWithString:@"https://sso.stu.edu.cn/login"];
            break;
        case 2:
            NSLog(@"2");
            _url = [NSURL URLWithString:@"http://a.stu.edu.cn/"];
            break;
        case 3:
            NSLog(@"3");
            _url = [NSURL URLWithString:@"http://d.stulip.org"];
            break;
        case 4:
            NSLog(@"4");
            _url = [NSURL URLWithString:@"https://www.bilibili.com"];
            break;
        case 5:
            NSLog(@"5");
            _url = [NSURL URLWithString:@"http://cn.bing.com"];
            break;
        case 6:
            NSLog(@"6");
            _url = [NSURL URLWithString:@"https://www.google.com"];
            break;
        case 7:
            NSLog(@"7");
            _url = [NSURL URLWithString:@"https://www.baidu.com"];
            break;
        case 8:
            NSLog(@"8");
            _url = [NSURL URLWithString:@"http://news.163.com"];
            break;
        case 9:
            NSLog(@"9");
            _url = [NSURL URLWithString:@"https://zh.airbnb.com/"];
            break;
        default:
            break;
    }
    _webViewController = [[UIViewController alloc]init];
    _webView = [UIWebView new];
    _webView.sd_layout
    .heightIs(SCREEN_HEIGHT)
    .widthIs(SCREEN_WIDTH)
    .topSpaceToView(_webViewController.view, 0)
    .leftSpaceToView(_webViewController.view, 0);
    _webView.scalesPageToFit = YES;//自动对页面进行缩放以适应屏幕
    [_webViewController.view addSubview:_webView];
    NSURLRequest* request = [NSURLRequest requestWithURL:_url];//创建NSURLRequest
    [_webView loadRequest:request];//加载
    _webViewController.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:_webViewController  animated:true];
    self.hidesBottomBarWhenPushed=NO;
}

@end
