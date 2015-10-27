//
//  MDYAlertView.h
//  YuanFang
//
//  Created by dell on 15/10/15.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDYAlertView : UIView
@property (strong, nonatomic) IBOutlet UILabel *textLabel;

@property (strong, nonatomic) IBOutlet UIView *view;

@property (assign, getter=isShow) BOOL show;

/**
 *  根据传入的图片 显示一个提醒
 *
 *  @param text 提醒的内容
 */
- (void)showWithText:(NSString *)text;

/**
 *  隐藏警告视图并移除
 */
- (void)hide;


+ (instancetype)sharedAlert;
@end
