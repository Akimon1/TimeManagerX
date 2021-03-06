//
//  TMListCollectionViewCell.m
//  TimeManagerX
//
//  Created by yu on 2/6/17.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMListCollectionViewCell.h"

@implementation TMListCollectionViewCell



-(void)singleTapAction:(UIGestureRecognizer*) recognizer
{
    if(!_isEditable){
        [_editControllBtn setTitle:@"editable" forState:UIControlStateNormal];
        _isEditable = YES;
        _memoContentTextView.editable = _isEditable;
    }else {
        [_editControllBtn setTitle:@"unedit" forState:UIControlStateNormal];
        _isEditable = NO;
        _memoContentTextView.editable = _isEditable;
    }
}

- (id)initWithFrame:(CGRect)frame {
    _isEditable = NO;
    CGFloat cellWidth = frame.size.width;
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _titleLabel = [UILabel new];
        [self addSubview:_titleLabel];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont fontWithName:kTextFont size:20];

        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"任务标题";
        _titleLabel.sd_layout
        .topSpaceToView(self, 30)
        .centerXIs(self.width/2)
        .autoHeightRatio(0);
        [_titleLabel setSingleLineAutoResizeWithMaxWidth:cellWidth];
        
        _dateLabel = [UILabel new];
        [self addSubview:_dateLabel];
        _dateLabel.text = @"任务日期";
        _dateLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _dateLabel.font = [UIFont boldSystemFontOfSize:16];
        _dateLabel.sd_layout
        .leftSpaceToView(self, 6)
        .topSpaceToView(_titleLabel, 20)
        .widthIs(80)
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
        .topSpaceToView(_dateLabel, 20)
        .widthIs(80)
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
        .topSpaceToView(_startLabel, 20)
        .widthIs(80)
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
        .topSpaceToView(_endLabel, 20)
        .widthIs(80)
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
        .topSpaceToView(_lastingLabel, 20)
        .widthIs(80)
        .autoHeightRatio(0);
        
        _locationContentLabel = [UILabel new];
        [self addSubview:_locationContentLabel];
        _locationContentLabel.text = @"地点啊";
        _locationContentLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _locationContentLabel.font = [UIFont systemFontOfSize:15];
        _locationContentLabel.sd_layout
        .leftSpaceToView(_locationLabel, 14)
        .centerYEqualToView(_locationLabel)
        .widthIs(SCREEN_WIDTH*0.6)
        .autoHeightRatio(0);
        
        _memoLabel = [UILabel new];
        [self addSubview:_memoLabel];
        _memoLabel.text = @"备注";
        _memoLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1];
        _memoLabel.font = [UIFont boldSystemFontOfSize:16];
        _memoLabel.textAlignment = NSTextAlignmentCenter;
        _memoLabel.sd_layout
        .centerXIs(self.width/2)
        .topSpaceToView(_locationLabel, 20)
        .widthIs(80)
        .autoHeightRatio(0);
        
        _memoContentTextView = [UITextView new];
        _memoContentTextView.editable = _isEditable;
        [self addSubview:_memoContentTextView];
        _memoContentTextView.text = @"这里是备注，这里是备注，这里时备注，这里时备胎，这里时备注，这里是备注,这里是备注，这里是备注，这里时备注，这里时备胎，这里时备注，这里是备注";
        _memoContentTextView.textColor = [UIColor whiteColor];
        _memoContentTextView.font = [UIFont systemFontOfSize:14];
        _memoContentTextView.backgroundColor = [UIColor colorWithRed:215.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1];
        _memoContentTextView.layer.cornerRadius = 7.0f;
        _memoContentTextView.sd_layout
        .topSpaceToView(_memoLabel, 10)
        .centerXEqualToView(_memoLabel)
        .widthIs(cellWidth-12)
        .bottomSpaceToView(self, 7);
        
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 17;
        self.layer.masksToBounds = YES;
        
        self.backgroundColor = [UIColor whiteColor];
        
        //编辑按钮
        _editControllBtn = [UIButton new];
        _editControllBtn.titleLabel.textColor = [UIColor blackColor];
        _editControllBtn.layer.cornerRadius = 5;
        _editControllBtn.layer.masksToBounds = YES;
        _editControllBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [_editControllBtn setTitle:@"unedit" forState:UIControlStateNormal];
        [_editControllBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_editControllBtn setBackgroundColor:[UIColor grayColor]];
        _editControllBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        [_editControllBtn addTarget:self action:@selector(singleTapAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_editControllBtn];
        
        _editControllBtn.sd_layout
        .topSpaceToView(self, 10)
        .leftSpaceToView(_titleLabel, 40)
        .widthIs(40)
        .heightIs(20);
    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}
@end
