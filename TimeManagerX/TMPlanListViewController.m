//
//  TMPlanListViewController.m
//  TimeManagerX
//
//  Created by yu on 2017/7/5.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMPlanListViewController.h"



@interface TMPlanListViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation TMPlanListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self initArray];
    [self searchTable];
    [self setupPlanListView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)initArray{
    _planListInfoMutableArray = [[NSMutableArray alloc] initWithCapacity:1];
}

-(void)setupPlanListView{
    [self.view setBackgroundColor:[UIColor colorWithRed:152/255.0 green:245/255.0 blue:255/255.0 alpha:1]];
}

-(void) setupTableView{
    //tableView相关内容，包括headerView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH*0.025,knavigationHeight+SCREEN_HEIGHT*0.02, SCREEN_WIDTH*0.95, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    _tableView.backgroundColor=[UIColor colorWithRed:152/255.0 green:245/255.0 blue:255/255.0 alpha:1];
    [self.view addSubview:_tableView];
}

-(void)searchTable{
    NSString *className = @"plan";
    BmobQuery   *bquery = [BmobQuery queryWithClassName:className];
    BmobUser *bmobUser = [BmobUser currentUser];
    if(bmobUser){
        //查找plan表对应user的数据
        [bquery whereKey:@"user_Name" equalTo:bmobUser.username];
        [bquery findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
            if (error){
                [KVNProgress showErrorWithStatus:@"获取计划列表失败。\n请检查网络连接。"];
            }else{
                for (BmobObject *obj in array) {
                    Plan *info    = [[Plan alloc] init];
                    info.planName    = [obj objectForKey:@"plan_Name"];
                    info.planTime  = [obj objectForKey:@"plan_time"];
                    info.planPain = [obj objectForKey:@"plan_pain"];
                    info.planMotto = [obj objectForKey:@"plan_motto"];
                    [_planListInfoMutableArray addObject:info];
                }
                [self setupTableView];
                [KVNProgress showSuccessWithStatus:@"获取计划列表成功！"];
            }
        }];

    }else{
        [KVNProgress showErrorWithStatus:@"连接失败"];
    }

}

#pragma mark - tableview Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_planListInfoMutableArray count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT*0.05;
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
    Plan *info             = (Plan*)[_planListInfoMutableArray objectAtIndex:indexPath.section];
    cell.textLabel.text = info.planName;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.layer.cornerRadius = 10;
    cell.layer.masksToBounds = YES;
    //设置cell颜色白色
    cell.backgroundColor=[UIColor whiteColor];
    //设置cell选中
    cell.selectionStyle=UITableViewCellSelectionStyleDefault;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Plan *info             = (Plan*)[_planListInfoMutableArray objectAtIndex:indexPath.section];
    NSString *messageString = [NSString stringWithFormat:@"计划时间：%@\n计划宣言：%@\n当前用时：%@\n\n是否显示在首页？",info.planTime,info.planMotto,info.planPain];
    _alertController = [UIAlertController alertControllerWithTitle:info.planName message:messageString preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

    }];
    UIAlertAction *cencal = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [_alertController addAction:cencal];
    [_alertController addAction:ok];
    [self presentViewController:_alertController animated:YES completion:nil];
    
}


@end
