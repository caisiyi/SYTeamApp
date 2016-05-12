//
//  XLPopMenuViewSingleton.m
//  PopMenu_QQ_Demo
//
//  Created by yuanxiaolong on 16/3/28.
//  Copyright © 2016年 yuanxiaolong. All rights reserved.
//

#import "XLPopMenuViewSingleton.h"
#import "XLPopMenuView.h"

@interface XLPopMenuViewSingleton ()

@property (nonatomic, strong) XLPopMenuView *popmenuView;

@end

@implementation XLPopMenuViewSingleton

+ (XLPopMenuViewSingleton *)shareManager
{
    static XLPopMenuViewSingleton *_popMenuViewSingleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _popMenuViewSingleton = [[XLPopMenuViewSingleton alloc] init];
    });
    return _popMenuViewSingleton;
}

- (void)creatPopMenuWithFrame:(CGPoint)startPoint
                 popMenuWidth:(CGFloat)width
                 popMenuItems:(NSArray *)items
                       action:(void(^)(NSInteger index))action
{
    __weak __typeof(&*self)weakSelf = self;
    if (self.popmenuView != nil)
    {
        [weakSelf menuHide];
    }
    
    UIWindow *window = [[[UIApplication sharedApplication] windows] firstObject];
    self.popmenuView = [[XLPopMenuView alloc] initWithFrame:window.bounds
                                             menuStartPoint:startPoint
                                                  menuWidth:width
                                                  menuItems:items
                                                     action:^(NSInteger index) {
                                                         action(index);
                                                         [weakSelf menuHide];
                                                     }];
    self.popmenuView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.3];//[[UIColor blackColor] colorWithAlphaComponent:0.2];
    [window addSubview:self.popmenuView];
    
    
    [UIView animateWithDuration:0.3 animations:^{
       
        self.popmenuView.popMenuTableView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    }];
    
}

- (void)menuHide
{
    [UIView animateWithDuration:0.3 animations:^{
        self.popmenuView.popMenuTableView.transform = CGAffineTransformMakeScale(0.01, 0.01);
        
    } completion:^(BOOL finished) {
        [self.popmenuView.popMenuTableView removeFromSuperview];
        [self.popmenuView removeFromSuperview];
        self.popmenuView.popMenuTableView = nil;
        self.popmenuView = nil;
    }];
}

@end
