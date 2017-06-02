//
//  TMPersonalViewController.m
//  TimeManagerX
//
//  Created by yu on 2017/6/2.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMPersonalViewController.h"

@interface TMPersonalViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation TMPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupPersonView];
    [self setTableViewer];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

-(void)setupPersonView{
    [self.view setBackgroundColor:[UIColor colorWithRed:0/255.0 green:207/255.0 blue:255/255.0 alpha:1]];
}

-(void)setTableViewer{                                                                  //设置tableView界面
    //tableView相关内容，包括headerView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    _tableView.scrollEnabled =NO; //设置tableview 不能滚动
    _tableView.backgroundColor=[UIColor colorWithRed:0/255.0 green:207/255.0 blue:255/255.0 alpha:1];
    _tableView.sd_layout
    .heightIs(SCREEN_HEIGHT);
    _headerView = [UIView new];   //headerView
    _headerView.backgroundColor = [UIColor colorWithRed:0/255.0 green:207/255.0 blue:255/255.0 alpha:1];
    _headerView.sd_layout
    .topSpaceToView(_tableView, 0)
    .heightIs(SCREEN_WIDTH*0.7)
    .widthIs(SCREEN_WIDTH);
    _userPhoto = [UIImageView new];
    _userPhoto.image = [UIImage imageNamed:@"userPhoto"];
    _userPhoto.layer.cornerRadius = _userPhoto.frame.size.width / 2;;
    _userPhoto.layer.masksToBounds = YES;
    _userPhoto.sd_layout
    .heightIs(SCREEN_WIDTH*0.6)
    .widthIs(SCREEN_WIDTH*0.6)
    ;
    [_headerView addSubview:_userPhoto];
    
    _tableView.tableHeaderView = _headerView;
    _tableView.estimatedRowHeight = 100;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:_tableView];
    
}
#pragma mark - tableview Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT*0.1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 为其定义一个标识符，在重用机制中，标识符非常重要，这是系统用来匹配table各行cell的判断标准，在以后的学习中会体会到
    static NSString *cellIdentifier = @"cellIdentifier";
    
    // 从缓存队列中取出复用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // 如果队列中cell为空，即无复用的cell，则对其进行初始化
    if (cell==nil) {
        // 初始化
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier: cellIdentifier];
    }
    //设置cell颜色透明
    cell.backgroundColor=[UIColor whiteColor];
    //设置cell选中时为无色
    cell.selectionStyle=UITableViewCellSelectionStyleDefault;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
