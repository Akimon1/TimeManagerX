//
//  TMPlanDetailViewController.m
//  TimeManagerX
//
//  Created by djwang on 2017/6/3.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMPlanDetailViewController.h"

@interface TMPlanDetailViewController () <UITableViewDelegate>

@property (nonatomic,strong) UILabel *mgoalLabel;
@property (nonatomic,strong) UILabel *minvestLabel;
@property (nonatomic,strong) UILabel *mgainLabel;

@property (nonatomic,strong) UILabel *mplanNameLabel;
@property (nonatomic,strong) UILabel *mmottoLabel;


@end

@implementation TMPlanDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    [self setupHeadViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    [self setupIntrViewWithFrame:CGRectMake(0, 200, SCREEN_WIDTH, 60)];
    [self setupPeriodViewWithFrame:CGRectMake(0, 260, SCREEN_WIDTH, SCREEN_HEIGHT-260)];
    [self initData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setupHeadViewWithFrame: (CGRect)frame {
    _headView = [[UIView alloc] initWithFrame:frame];
    _headView.backgroundColor = kTitle_bar_Color;
    
    _mplanNameLabel = [UILabel new];
    _mplanNameLabel.textAlignment = NSTextAlignmentCenter;
    _mplanNameLabel.textColor = [UIColor whiteColor];
    
    _mmottoLabel = [UILabel new];
    _mmottoLabel.textAlignment = NSTextAlignmentCenter;
    _mmottoLabel.textColor = [UIColor whiteColor];
    
    [_headView sd_addSubviews:@[_mplanNameLabel, _mmottoLabel]];
    [self.view addSubview:_headView];
    
    _mplanNameLabel.sd_layout
    .widthIs(frame.size.width)
    .heightIs(60)
    .topSpaceToView(_headView, 50);
    
    _mmottoLabel.sd_layout
    .widthIs(frame.size.width)
    .heightIs(30)
    .bottomSpaceToView(_headView, 40);
    

}

- (void)setupIntrViewWithFrame: (CGRect)frame {
    //TODO
    //细节UI+layout
    _intrView = [[UIView alloc] initWithFrame:frame];
    _intrView.backgroundColor = [UIColor whiteColor];
    
    CGFloat oneOfThreeWidth = frame.size.width / 3;
    CGFloat frameHeight = frame.size.height;
    CGFloat halfFrameHeight = frame.size.height/2;
    
    UIView *goalView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, oneOfThreeWidth, frameHeight)];
    UILabel *goalLabel = [UILabel new];
    goalLabel.text = @"目标";
    goalLabel.textAlignment = NSTextAlignmentCenter;
    _mgoalLabel = [UILabel new];
    _mgoalLabel.textAlignment = NSTextAlignmentCenter;
    [goalView sd_addSubviews:@[goalLabel, _mgoalLabel]];
    
    goalLabel.sd_layout
    .widthIs(oneOfThreeWidth)
    .heightIs(halfFrameHeight)
    .xIs(0)
    .yIs(0);
    
    _mgoalLabel.sd_layout
    .widthIs(oneOfThreeWidth)
    .heightIs(halfFrameHeight)
    .xIs(0)
    .yIs(halfFrameHeight);
    
    
    
    UIView *investView = [[UIView alloc] initWithFrame:CGRectMake(oneOfThreeWidth, 0, oneOfThreeWidth, frameHeight)];
    UILabel *investLabel = [UILabel new];
    investLabel.text = @"总投入";
    investLabel.textAlignment = NSTextAlignmentCenter;
    _minvestLabel = [UILabel new];
    _minvestLabel.textAlignment = NSTextAlignmentCenter;
    [investView sd_addSubviews:@[investLabel, _minvestLabel]];
    
    investLabel.sd_layout
    .widthIs(oneOfThreeWidth)
    .heightIs(halfFrameHeight)
    .xIs(0)
    .yIs(0);
    
    _minvestLabel.sd_layout
    .widthIs(oneOfThreeWidth)
    .heightIs(halfFrameHeight)
    .xIs(0)
    .yIs(halfFrameHeight);
    
    
    UIView *gainView = [[UIView alloc] initWithFrame:CGRectMake(oneOfThreeWidth*2, 0, oneOfThreeWidth, frameHeight)];
    UILabel *gainLabel = [UILabel new];
    gainLabel.text = @"已获得";
    gainLabel.textAlignment = NSTextAlignmentCenter;
    _mgainLabel = [UILabel new];
    _mgainLabel.textAlignment = NSTextAlignmentCenter;
    [gainView sd_addSubviews:@[gainLabel, _mgainLabel]];
    
    gainLabel.sd_layout
    .widthIs(oneOfThreeWidth)
    .heightIs(halfFrameHeight)
    .xIs(0)
    .yIs(0);
    
    _mgainLabel.sd_layout
    .widthIs(oneOfThreeWidth)
    .heightIs(halfFrameHeight)
    .xIs(0)
    .yIs(halfFrameHeight);
    
    
    [_intrView sd_addSubviews:@[goalView, investView, gainView]];
    [self.view addSubview:_intrView];
    
    
}

-(void) initData {
    _mplanNameLabel.text = @"一级项目开发";
    _mmottoLabel.text = @"不给自己的双手放假";
    _mgoalLabel.text = @"100 hours";
    _minvestLabel.text = @"70 hours";
    _mgainLabel.text = @"鼓励奖";
    
}

- (void)setupPeriodViewWithFrame: (CGRect)frame {
    _periodView = [[UITableView alloc] initWithFrame:frame];
    _periodView.backgroundColor = [[UIColor alloc] initWithRed:245 green:245 blue:245 alpha:0.5];
    _periodView.separatorStyle = NO;
    
    [self.view addSubview:_periodView];
    
}

@end
