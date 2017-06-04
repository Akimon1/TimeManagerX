//
//  TMListCollectionViewCell.h
//  TimeManagerX
//
//  Created by yu on 2/6/17.
//  Copyright © 2017年 yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TMListCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) UIButton *editControllBtn;

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *dateLabel;
@property (nonatomic,strong) UILabel *taskDateLabel;
@property (nonatomic,strong) UILabel *startLabel;
@property (nonatomic,strong) UILabel *startTimeLabel;
@property (nonatomic,strong) UILabel *endLabel;
@property (nonatomic,strong) UILabel *endTimeLabel;
@property (nonatomic,strong) UILabel *lastingLabel;
@property (nonatomic,strong) UILabel *lastingTimeLabel;
@property (nonatomic,strong) UILabel *locationLabel;
@property (nonatomic,strong) UILabel *locationContentLabel;
@property (nonatomic,strong) UILabel *memoLabel;
@property (nonatomic,strong) UITextView *memoContentTextView;


@property (nonatomic) BOOL isEditable;

@end
