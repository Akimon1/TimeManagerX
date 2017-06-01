//
//  TMLoginViewController.h
//  TimeManagerX
//
//  Created by djwang on 2017/6/1.
//  Copyright © 2017年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMSignView.h"

@interface TMSignViewController : UIViewController

@property (nonatomic,strong) UIImageView *backgroundImageView;
@property (nonatomic,strong) TMSignView *signView;
@property (nonatomic,strong) UIButton *forgetPwdBtn;

@end
