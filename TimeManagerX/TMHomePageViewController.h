//
//  TMHomePageViewController.h
//  TimeManagerX
//
//  Created by yu on 2017/5/31.
//  Copyright © 2017年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMPersonalViewController.h"

@interface TMHomePageViewController : UIViewController
@property (nonatomic,strong) UIBarButtonItem *leftButton;
@property (nonatomic,strong) UIBarButtonItem *rightButton;
@property (nonatomic,strong) TMPersonalViewController *personViewController;
@end
