//
//  TMHomeViewController.h
//  TimeManagerX
//
//  Created by yu on 2017/5/31.
//  Copyright © 2017年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMHomePageViewController.h"
#import "TMListPageViewController.h"
#import "TMFunPageViewController.h"

@interface TMHomeViewController : UIViewController
@property (nonatomic,strong) UITabBarController *homeViewController;
@property (nonatomic,strong) TMHomePageViewController *homePage;
@property (nonatomic,strong) TMListPageViewController *listPage;
@property (nonatomic,strong) TMFunPageViewController *funPage;
@property (nonatomic,strong) UINavigationController *homePageNavigationController;
@property (nonatomic,strong) UINavigationController *listPageNavigationController;
@property (nonatomic,strong) UINavigationController *funPageNavigationController;
@end
