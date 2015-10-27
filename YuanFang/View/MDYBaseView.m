//
//  MDYBaseView.m
//  YuanFang
//
//  Created by dell on 15/10/16.
//  Copyright (c) 2015年 dell. All rights reserved.
//


#import "MDYBaseView.h"
#import "MDYLoadView.h"
#import "AFNetworking.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface MDYBaseView () <MDYLoadViewDelegate> {
    MDYLoadView *loadView;
}

@end

@implementation MDYBaseView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
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
    [self addSubview:loadView];
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
