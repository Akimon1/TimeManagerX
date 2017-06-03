//
//  TMPlanCreateViewController.m
//  TimeManagerX
//
//  Created by djwang on 2017/6/3.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMPlanCreateViewController.h"
#import "TMPlanCreateCell.h"
@interface TMPlanCreateViewController () <UITableViewDataSource,UITabBarDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSString *planName;
@property (nonatomic,strong) NSString *planTime;
@property (nonatomic,strong) NSString *planMotto;


@end

@implementation TMPlanCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"创建计划";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- tableview Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取自动计算出的cell高度。SDAutoLayout方法。
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:SCREEN_WIDTH tableView:tableView];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL classRegister = NO;
    if(!classRegister){
        Class myclass = [TMPlanCreateCell class];
        [tableView registerClass:myclass forCellReuseIdentifier:@"TMPlanCreateCell"];
        classRegister = YES;
    }
    
    TMPlanCreateCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TMPlanCreateCell"];
    switch (indexPath.row) {
        case 0:
            cell.mTextField.placeholder = @"健身，学外语，读书";
            cell.iconImgView.image = [UIImage imageNamed:@"list"];
            break;
        case 1:
            cell.mTextField.placeholder = @"时间目标";
            cell.iconImgView.image = [UIImage imageNamed:@"clock"];
            break;
        case 2:
            cell.mTextField.placeholder = @"激励口号";
            cell.iconImgView.image = [UIImage imageNamed:@"smile"];
        default:
            break;
    }
    return cell;
}


@end
