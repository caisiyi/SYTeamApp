//
//  XLPopMenuView.h
//  PopMenu_QQ_Demo
//
//  Created by yuanxiaolong on 16/3/28.
//  Copyright © 2016年 yuanxiaolong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLPopMenuView : UIView

@property (nonatomic, strong) UITableView *popMenuTableView;

/**
 *  创建tableView
 *
 *  @param frame
 *  @param satrtPoint  整个弹框左上角坐标
 *  @param menuWidth  弹出框的宽度
 *  @param items     模型数组
 *  @param action    cell选中标识
 *
 *  @return 返回所点击的cell
 */
- (instancetype)initWithFrame:(CGRect)frame
               menuStartPoint:(CGPoint)startPoint
                    menuWidth:(CGFloat)menuWidth
                        menuItems:(NSArray *)items
                       action:(void (^)(NSInteger index))action;


@end
