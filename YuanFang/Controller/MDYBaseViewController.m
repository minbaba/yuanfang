//
//  BaseViewController.m
//  PRO092201  -- Limmit_demo_chuan
//
//  Created by dell on 15/9/22.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import "MDYBaseViewController.h"
#import "AFNetworking.h"
#import "JGProgressHUD.h"
#import "AppDelegate.h"
#import "MDYNavigationController.h"
#import "MDYLoadView.h"
#import "MDYScrollView.h"

/**
 *  这个类中主要检测网络
 *  如果子类全部继承与这个类
 *  这些子类都有检测网络状态的功能
 */

@interface MDYBaseViewController () <MDYLoadViewDelegate>{
    MDYLoadView *loadView;
}

@end

@implementation MDYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.contentView = [[MDYScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT -64)];
    self.contentView.pagingEnabled = YES;
    self.contentView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.contentView];
    
    // 检测网络状态
    [self checkNetWork];
    
    // 设置全局 navigationbar 不透明
    self.navigationController.navigationBar.translucent = NO;
}

/**
 *  根据字符串 显示一个 hub
 *
 *  @param str 提示内容
 */
- (void)showProgress {
    if (!maskView) {
        hud = [[AMTumblrHud alloc] initWithFrame:CGRectMake(0, 0, 55, 22)];
        hud.center = CGPointMake(maskView.bounds.size.width /2.0f, maskView.bounds.size.height /2.0f);
        hud.hudColor = [UIColor magentaColor];
        
        maskView = [[UIView alloc] initWithFrame:self.view.frame];
        [maskView addSubview:hud];
    }
    
    [self.view addSubview:maskView];
    [hud showAnimated:YES];
}

/**
 *  隐藏菊花
 */
- (void)hideHud {
    if (maskView) {
        [UIView animateWithDuration:0.2f animations:^{
            maskView.alpha = 0;
        } completion:^(BOOL finished) {
            [maskView removeFromSuperview];
        }];
    }
}

/**
 *  检测网络的方法、回调
 */
- (void)checkNetWork {
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        /**
         *  判断网络状态
         */
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: {
                // 没有网络
                // 弹出警告
                [self.nvc showAlertWithText:@"当前没有网络..." time:2];
                break;
            }
            case AFNetworkReachabilityStatusNotReachable: {
                
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN: {
                
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi: {
                
                break;
            }
                
            default:
                break;
        }
        
    }];
}

/**
 *  显示alertView
 *
 *  @param str 警告内容
 */
- (void)showAVWithString:(NSString *)str {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:str delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    [av show];
}


/**
 *  加载网络数据
 *
 *  @param parameters 网络 GET 请求的 参数
 *  @param success    请求成功的回调
 */
- (void)loadDataWithParameters:(NSDictionary *)parameters opration:(void (^)(id responseObject))success {
    
    if (!loadView) {
        loadView = [[MDYLoadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT -64)];
        
        loadView.delegate = self;
    }
    [self.view addSubview:loadView];
    [loadView load];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 关闭自动解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    [manager GET:self.url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        // 请求成功 调用 block 处理数据
        success(responseObject);
        
        // 移除加载界面
        [UIView animateWithDuration:0.3f animations:^{
            loadView.alpha = 0;
        } completion:^(BOOL finished) {
            [loadView removeFromSuperview];
            loadView = nil;
        }];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [self.nvc showAlertWithText:@"网络加载失败,请重试.." time:2];
        
        if (loadView) {
            [loadView refresh];
        }
    }];
}

- (void)loadData {
    if (!loadView) {
        [loadView load];
    }
}


- (void)loadViewRefresh:(MDYLoadView *)view {
    [self loadData];
}

@end
