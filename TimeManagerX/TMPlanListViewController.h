//
//  TMPlanListViewController.h
//  TimeManagerX
//
//  Created by yu on 2017/7/5.
//  Copyright © 2017年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Plan.h"
#import "BmobSDK/BmobUser.h"
#import "BmobSDK/BmobQuery.h"
#import "TMPlanView.h"

@interface TMPlanListViewController : UIViewController
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong)   NSMutableArray      *planListInfoMutableArray;
@property (nonatomic,strong) UIAlertController *alertController;

@end
