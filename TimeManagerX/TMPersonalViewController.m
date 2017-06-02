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
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.025, 0, SCREEN_WIDTH*0.95, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
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
    _userPhoto.layer.cornerRadius = SCREEN_WIDTH*0.3;
    _userPhoto.layer.masksToBounds = YES;
    [_headerView addSubview:_userPhoto];
    _userPhoto.sd_layout
    .heightIs(SCREEN_WIDTH*0.6)
    .widthIs(SCREEN_WIDTH*0.6)
    .topSpaceToView(_headerView, SCREEN_WIDTH*0.05)
    .leftSpaceToView(_headerView, SCREEN_WIDTH*0.2)
    ;

    
    _tableView.tableHeaderView = _headerView;
    _tableView.estimatedRowHeight = 100;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.sectionFooterHeight = 5;
    [self.view addSubview:_tableView];
    
}

#pragma mark - tableview Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT*0.08;
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
    _userNameDefault = @"用户名:";
    _userIDDefault = @"ID:";
    BmobUser *bUser = [BmobUser currentUser];
    if (bUser) {
        _getUserName = bUser.username;
        _getID = bUser.objectId;
    }
    _userName = [_userNameDefault stringByAppendingString:_getUserName];
    _ID = [_userIDDefault stringByAppendingString:_getID];
    switch (indexPath.section) {
        case 0:
            [[cell textLabel]  setText:_userName];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            break;
        case 1:
            [[cell textLabel]  setText:_ID];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            break;
        case 2:
            [[cell textLabel]  setText:@"关于我们"];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            break;
        case 3:
            [[cell textLabel]  setText:@"注销"];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            break;
        default:
            [[cell textLabel]  setText:@""];
            break;
    }
    cell.layer.cornerRadius = 10;
    cell.layer.masksToBounds = YES;
    //设置cell颜色白色
    cell.backgroundColor=[UIColor whiteColor];
    //设置cell选中
    cell.selectionStyle=UITableViewCellSelectionStyleDefault;
    
    return cell;
}
-(void)aboutWE{
    _alertController = [UIAlertController alertControllerWithTitle:@"关于我们" message:@"FormTeam:TimeManager.stu\n LIN&DJ&JT" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [_alertController addAction:ok];
    [self presentViewController:_alertController animated:YES completion:nil];
}

-(void)logOut{
    _alertController = [UIAlertController alertControllerWithTitle:@"确定注销？" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [BmobUser logout];
        _signViewController = [TMSignViewController new];
        [self presentViewController:_signViewController animated:true completion:nil];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [_alertController addAction:ok];
    [_alertController addAction:cancel];
    [self presentViewController:_alertController animated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
        case 2:
            [self aboutWE];
            break;
        case 3:
            [self logOut];
            break;
        default:
            break;
    }

}




@end
