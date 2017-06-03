//
//  TMPlanCreateCell.m
//  TimeManagerX
//
//  Created by djwang on 2017/6/3.
//  Copyright © 2017年 yu. All rights reserved.
//

#import "TMPlanCreateCell.h"

@implementation TMPlanCreateCell
-(id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        _iconImgView = [UIImageView new];
        [self addSubview:_iconImgView];
        _iconImgView.sd_layout
        .widthIs(40)
        .heightIs(40)
        .leftSpaceToView(self, 0)
        .topSpaceToView(self, 0);
        
        _mTextField = [UITextField new];
        _mTextField.borderStyle = UITextBorderStyleNone;
        [self addSubview:_mTextField];
        _mTextField.sd_layout
        .heightIs(40)
        .leftSpaceToView(_iconImgView, 15)
        .rightSpaceToView(self, 0);
    }
    //设置cell高度自适应
    [self setupAutoHeightWithBottomView:_iconImgView bottomMargin:0];
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
