//
//  TMHomeViewController.m
//  TimeManagerX
//
//  Created by yu on 2017/5/31.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMHomeViewController.h"


@interface TMHomeViewController ()



@end

@implementation TMHomeViewController

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:nil];
    [self setupHomeView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor colorWithRed:152/255.0 green:245/255.0 blue:255/255.0 alpha:1];
    _welcomeLable = [UILabel new];
    _welcomeLable.text = @"欢迎";
    _welcomeLable.textAlignment = NSTextAlignmentCenter;
    _welcomeLable.font = [UIFont fontWithName:@"Arial-BoldMT" size:35];
    [self.view addSubview:_welcomeLable];
    _welcomeLable.sd_layout
    .widthIs(SCREEN_WIDTH)
    .heightIs(SCREEN_HEIGHT*0.2)
    .centerYEqualToView(self.view)
    ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) setupHomeView{
    _homeViewController = [UITabBarController new];
    _homePage = [TMHomePageViewController new];
    _listPage = [TMListPageViewController new];
    _funPage = [TMFunPageViewController new];
    _homePageNavigationController = [[UINavigationController alloc]initWithRootViewController:_homePage];
    _listPageNavigationController = [[UINavigationController alloc]initWithRootViewController:_listPage];
    _funPageNavigationController = [[UINavigationController alloc]initWithRootViewController:_funPage];
    _homePageNavigationController.tabBarItem.title = @"首页";
    _homePageNavigationController.tabBarItem.image = [UIImage imageNamed:@"首页icon"];
    _listPageNavigationController.tabBarItem.title = @"列表";
    _listPageNavigationController.tabBarItem.image = [UIImage imageNamed:@"列表icon"];
    _funPageNavigationController.tabBarItem.title = @"Fun";
    _funPageNavigationController.tabBarItem.image = [UIImage imageNamed:@"funicon"];
    _homeViewController.viewControllers = @[_homePageNavigationController,_listPageNavigationController,_funPageNavigationController];
    
    [self presentViewController:_homeViewController animated:true completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
