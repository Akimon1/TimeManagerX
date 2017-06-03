//
//  TMListCollectionViewCell.m
//  TimeManagerX
//
//  Created by yu on 2/6/17.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMListCollectionViewCell.h"

@implementation TMListCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [UILabel new];
        [self addSubview:_titleLabel];
        _titleLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"任务标题";
        _titleLabel.sd_layout
        .topSpaceToView(self, 30)
        .centerXIs(self.width/2)
        .autoHeightRatio(0);
        [_titleLabel setSingleLineAutoResizeWithMaxWidth:200];
        
        _dateLabel = [UILabel new];
        [self addSubview:_dateLabel];
        _dateLabel.text = @"任务日期";
        _dateLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _dateLabel.font = [UIFont boldSystemFontOfSize:16];
        _dateLabel.sd_layout
        .leftSpaceToView(self, 40)
        .topSpaceToView(_titleLabel, 40)
        .widthIs(100)
        .autoHeightRatio(0);
        
        _taskDateLabel = [UILabel new];
        [self addSubview:_taskDateLabel];
        _taskDateLabel.text = @"2017年04月11日";
        _taskDateLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _taskDateLabel.font = [UIFont systemFontOfSize:15];
        _taskDateLabel.sd_layout
        .leftSpaceToView(_dateLabel, 12)
        .centerYEqualToView(_dateLabel)
        .widthIs(120)
        .autoHeightRatio(0);
        
        _startLabel = [UILabel new];
        [self addSubview:_startLabel];
        _startLabel.text = @"开始时间";
        _startLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _startLabel.font = [UIFont boldSystemFontOfSize:16];
        _startLabel.sd_layout
        .leftEqualToView(_dateLabel)
        .topSpaceToView(_dateLabel, 40)
        .widthIs(100)
        .autoHeightRatio(0);
        
        _startTimeLabel = [UILabel new];
        [self addSubview:_startTimeLabel];
        _startTimeLabel.text = @"22:33:36";
        _startTimeLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _startTimeLabel.font = [UIFont systemFontOfSize:15];
        _startTimeLabel.sd_layout
        .leftSpaceToView(_startLabel, 14)
        .centerYEqualToView(_startLabel)
        .widthIs(70)
        .autoHeightRatio(0);
        
        _endLabel = [UILabel new];
        [self addSubview:_endLabel];
        _endLabel.text = @"结束时间";
        _endLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _endLabel.font = [UIFont boldSystemFontOfSize:16];
        _endLabel.sd_layout
        .leftEqualToView(_dateLabel)
        .topSpaceToView(_startLabel, 40)
        .widthIs(100)
        .autoHeightRatio(0);
        
        _endTimeLabel = [UILabel new];
        [self addSubview:_endTimeLabel];
        _endTimeLabel.text = @"23:33:39";
        _endTimeLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _endTimeLabel.font = [UIFont systemFontOfSize:15];
        _endTimeLabel.sd_layout
        .leftSpaceToView(_endLabel, 14)
        .centerYEqualToView(_endLabel)
        .widthIs(70)
        .autoHeightRatio(0);
        
        _lastingLabel = [UILabel new];
        [self addSubview:_lastingLabel];
        _lastingLabel.text = @"持续时间";
        _lastingLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _lastingLabel.font = [UIFont boldSystemFontOfSize:16];
        _lastingLabel.sd_layout
        .leftEqualToView(_dateLabel)
        .topSpaceToView(_endLabel, 40)
        .widthIs(100)
        .autoHeightRatio(0);
        
        _lastingTimeLabel = [UILabel new];
        [self addSubview:_lastingTimeLabel];
        _lastingTimeLabel.text = @"00:00:03";
        _lastingTimeLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _lastingTimeLabel.font = [UIFont systemFontOfSize:15];
        _lastingTimeLabel.sd_layout
        .leftSpaceToView(_lastingLabel, 14)
        .centerYEqualToView(_lastingLabel)
        .widthIs(100)
        .autoHeightRatio(0);
        
        _locationLabel = [UILabel new];
        [self addSubview:_locationLabel];
        _locationLabel.text = @"任务地点";
        _locationLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _locationLabel.font = [UIFont boldSystemFontOfSize:16];
        _locationLabel.sd_layout
        .leftEqualToView(_dateLabel)
        .topSpaceToView(_lastingLabel, 40)
        .widthIs(100)
        .autoHeightRatio(0);
        
        _locationContentLabel = [UILabel new];
        [self addSubview:_locationContentLabel];
        _locationContentLabel.text = @"地点";
        _locationContentLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _locationContentLabel.font = [UIFont systemFontOfSize:15];
        _locationContentLabel.layer.borderColor = [[UIColor colorWithRed:215.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
        _locationContentLabel.layer.borderWidth = 0.6f;
        _locationContentLabel.layer.cornerRadius = 6.0f;
        _locationContentLabel.sd_layout
        .leftSpaceToView(_locationLabel, 12)
        .centerYEqualToView(_locationLabel)
        .widthIs(150)
        .autoHeightRatio(0);
        
        _memoLabel = [UILabel new];
        [self addSubview:_memoLabel];
        _memoLabel.text = @"备注";
        _memoLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _memoLabel.font = [UIFont boldSystemFontOfSize:16];
        _memoLabel.textAlignment = NSTextAlignmentCenter;
        _memoLabel.sd_layout
        .centerXIs(self.width/2)
        .topSpaceToView(_locationLabel, 30)
        .widthIs(100)
        .autoHeightRatio(0);
        
        _memoContentLabel = [UILabel new];
        [self addSubview:_memoContentLabel];
        _memoContentLabel.text = @"备注啊";
        _memoContentLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _memoContentLabel.font = [UIFont systemFontOfSize:13];
        _memoContentLabel.backgroundColor = [UIColor whiteColor];
        _memoContentLabel.layer.borderColor = [[UIColor colorWithRed:215.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
        _memoContentLabel.layer.borderWidth = 0.6f;
        _memoContentLabel.layer.cornerRadius = 6.0f;
        _memoContentLabel.sd_layout
        .topSpaceToView(_memoLabel, 10)
        .centerXEqualToView(_memoLabel)
        .widthIs(200)
        .heightIs(70);
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 15;
        self.layer.masksToBounds = YES;
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end
