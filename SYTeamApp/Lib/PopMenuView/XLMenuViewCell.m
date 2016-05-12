//
//  XLMenuViewCell.m
//  PopMenu_QQ_Demo
//
//  Created by yuanxiaolong on 16/3/28.
//  Copyright © 2016年 yuanxiaolong. All rights reserved.
//

#import "XLMenuViewCell.h"

@implementation XLMenuViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.textLabel.font = [UIFont systemFontOfSize:15];
        
    }
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
