//
//  TMPlanCreateViewController.m
//  TimeManagerX
//
//  Created by djwang on 2017/6/3.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMPlanCreateViewController.h"
#import "TMPlanCreateCell.h"
#import "TMHomeViewController.h"
@interface TMPlanCreateViewController () <UITableViewDataSource,UITableViewDelegate,UITabBarDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIBarButtonItem *finishBtn;
@property (nonatomic,strong) NSString *planName;
@property (nonatomic,strong) NSString *planTime;
@property (nonatomic,strong) NSString *planMotto;


@end

@implementation TMPlanCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"创建计划";
    [self setupTableView];
    [self setupFinishBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupTableView {
    _tableView = [UITableView new];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.scrollEnabled = NO;
    _tableView.separatorStyle = NO;
    _tableView.tableFooterView = [UIView new];
    [self.view addSubview:_tableView];
    _tableView.sd_layout
    .topSpaceToView(self.view, SCREEN_WIDTH *0.2)
    .widthIs(SCREEN_WIDTH)
    .heightIs(SCREEN_HEIGHT *0.5);
}

-(void)setupFinishBtn {
    _finishBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"finish32"] style:UIBarButtonItemStylePlain target:self action:@selector(finishEdit:)];
    self.navigationItem.rightBarButtonItem = _finishBtn;
}

-(void)finishEdit:(id)sender {
    if([_finishBtn isEqual:sender]){
        //TODO
        //传输数据或者保存数据到网络
        //往task表添加一条task_name,task_from,task_to,task_location的数据
        BmobObject *newTask = [BmobObject objectWithClassName:@"plan"];
        
        //将数据与用户连接
        BmobUser *bmobUser = [BmobUser currentUser];
        if(bmobUser){
            [newTask setObject:bmobUser.username      forKey:@"user_Name"];     //user
            
            [newTask setObject:[self planName]      forKey:@"plan_Name"];
            [newTask setObject:[self planTime]      forKey:@"plan_time"];
            [newTask setObject:[self planMotto]     forKey:@"plan_motto"];
            [newTask setObject:@(0)           forKey:@"plan_pain"];

            NSLog(@"%@", [self planMotto]);
            NSLog(@"%@", [self planName]);
            [newTask saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
                if (isSuccessful) {
                    //创建成功后会返回objectId，updatedAt，createdAt等信息
                    //创建对象成功，打印对象值
                    NSLog(@"%@",newTask);
                    [KVNProgress showSuccessWithStatus:@"计划已创建"];
                    [self presentViewController:[TMHomeViewController new] animated:true completion:nil];
                } else if (error){
                    //发生错误后的动作
                    NSLog(@"%@",error);
                    [KVNProgress showErrorWithStatus:@"保存失败，遇到了不可预知的意外呢。"];
                } else {
                    NSLog(@"Unknow error");
                }
            }];
        }else{
            //缓存用户对象为空时， 可打开用户注册界面…
        }
        
    }
}

-(NSString *)planName{
    return  self.tableView.visibleCells[0].textLabel.text;
}

-(NSString *)planTime{
    return self.tableView.visibleCells[1].textLabel.text;
}

-(NSString *)planMotto{
    return self.tableView.visibleCells[2].textLabel.text;
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
