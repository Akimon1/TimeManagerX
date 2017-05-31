//
//  TMHomeViewController.m
//  TimeManagerX
//
//  Created by yu on 2017/5/31.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMHomeViewController.h"
#import "TMHomePageViewController.h"
#import "TMListPageViewController.h"
#import "TMFunPageViewController.h"

@interface TMHomeViewController ()
@property (nonatomic,strong) UITabBarController *homeViewController;
@property (nonatomic,strong) TMHomePageViewController *homePage;
@property (nonatomic,strong) TMListPageViewController *listPage;
@property (nonatomic,strong) TMFunPageViewController *funPage;
@property (nonatomic,strong) UINavigationController *homePageNavigationController;
@property (nonatomic,strong) UINavigationController *listPageNavigationController;
@property (nonatomic,strong) UINavigationController *funPageNavigationController;

@end

@implementation TMHomeViewController

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:nil];
    [self setupHomeView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor  = [UIColor whiteColor];
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
