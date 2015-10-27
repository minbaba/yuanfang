//
//  BaseViewController.h
//  PRO092201  -- Limmit_demo_chuan
//
//  Created by dell on 15/9/22.
//  Copyright (c) 2015年 dell. All rights reserved.
//


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height



#import <UIKit/UIKit.h>
#import "AMTumblrHud.h"


#define IMAGE_URL_PRI @"http://images.shigeten.net/"

@class MDYNavigationController;
@class MDYNavigationBar;

@class JGProgressHUD;

@interface MDYBaseViewController : UIViewController {
    AMTumblrHud *hud;
    UIView *maskView;
}

@property (strong ,nonatomic) UIScrollView *contentView;

@property (strong, nonatomic) MDYNavigationController *nvc;
@property (strong, nonatomic) MDYNavigationBar *nvBar;

@property (nonatomic, copy)NSString *url;

/**
 *  显示alertView
 *
 *  @param str 警告的内容
 */
- (void)showAVWithString:(NSString *) str;

/**
 *  根据参数 GET 参数 和处理消息的 block 进行网络 GET 请求
 *
 *  @param parameters GET 请求参数 没有参数时为 nil
 *  @param success    请求成功时的回调
 */
- (void)loadDataWithParameters:(NSDictionary *)parameters opration:(void (^)(id responseObject))success;

/**
 *  根据字符串 显示一个 hub
 *
 *  @param str 提示内容
 */
- (void)showProgress;

/**
 *  加载数据 没有实现 需要子类根据需要自行实现
 */
- (void)loadData;

/**
 *  隐藏菊花
 */
- (void)hideHud;

@end
