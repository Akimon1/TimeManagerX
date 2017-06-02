//
//  TMPersonalViewController.h
//  TimeManagerX
//
//  Created by yu on 2017/6/2.
//  Copyright © 2017年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BmobSDK/Bmob.h"
#import "BmobSDK/BmobUser.h"
#import "TMSignViewController.h"

@interface TMPersonalViewController : UIViewController
@property (nonatomic,strong) UIImageView *backgroundImageView;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *headerView;
@property (nonatomic,strong) UIImageView *userPhoto;
@property (nonatomic,strong) NSString  *userNameDefault;
@property (nonatomic,strong) NSString  *getUserName;
@property (nonatomic,strong) NSString  *userName;
@property (nonatomic,strong) NSString  *userIDDefault;
@property (nonatomic,strong) NSString  *getID;
@property (nonatomic,strong) NSString  *ID;
@property (nonatomic,strong) UIAlertController *alertController;
@property (nonatomic,strong) TMSignViewController *signViewController;
@end
