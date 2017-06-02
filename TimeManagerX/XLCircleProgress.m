//
//  CircleView.m
//  YKL
//
//  Created by Apple on 15/12/7.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "XLCircleProgress.h"
#import "XLCircle.h"

@implementation XLCircleProgress
{
    XLCircle* _circle;
    UILabel *_percentLabel;
    UILabel *_totalTimeLabel;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}


-(void)initUI
{
    float lineWidth = 0.1*self.bounds.size.width;
    _percentLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _percentLabel.textColor = [UIColor blackColor];
    _percentLabel.textAlignment = NSTextAlignmentCenter;
    _percentLabel.font = [UIFont boldSystemFontOfSize:50];
    _percentLabel.text = @"0%";
    [self addSubview:_percentLabel];
    
    CGRect halfBound = CGRectMake(0, self.bounds.size.width/2, self.bounds.size.width, self.bounds.size.height/2);
    _totalTimeLabel = [[UILabel alloc] initWithFrame:halfBound];
    _totalTimeLabel.textColor = [UIColor blackColor];
    _totalTimeLabel.font = [UIFont boldSystemFontOfSize:20];
    _totalTimeLabel.textAlignment = NSTextAlignmentCenter;
    _totalTimeLabel.text = @"100 hours";
    [self addSubview:_totalTimeLabel];

    
    _circle = [[XLCircle alloc] initWithFrame:self.bounds lineWidth:lineWidth];
    [self addSubview:_circle];
}

#pragma mark -
#pragma mark Setter方法
-(void)setProgress:(float)progress
{
    _progress = progress;
    _circle.progress = progress;
    _percentLabel.text = [NSString stringWithFormat:@"%.0f%%",progress*100];
}

-(void)setTotalTime:(int)totalTime
{
    _totalTime = totalTime;
    _totalTimeLabel.text = [NSString stringWithFormat:@"%d hours",totalTime];
}

@end
