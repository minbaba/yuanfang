//
//  MDYMainViewController.m
//  YuanFang
//
//  Created by dell on 15/10/14.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import "MDYCriticViewController.h"
#import "MDYCritcView.h"
#import "MDYCriticModel.h"
#import "MDYNavigationController.h"
#import "MDYArticleViewController.h"
#import "SDPhotoBrowser.h"
#import "MDYReviewView.h"

@interface MDYCriticViewController () <MDYNavigationBarDelegaete, SDPhotoBrowserDelegate> {
    NSMutableArray * picArr;
}

@end

@implementation MDYCriticViewController


+ (instancetype)sharedCriticViewController {
    static MDYCriticViewController *vc = nil;
    
    if (!vc) {
        vc = [[MDYCriticViewController alloc] init];
        
        vc.nvc = [[MDYNavigationController alloc] initWithNavigationBarClass:[MDYNavigationBar class] toolbarClass:[UIToolbar class]];
        vc.nvc.viewControllers = @[vc];
        vc.nvBar = (id) vc.nvc.navigationBar;
    }
    
    return vc;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nvBar.myDelegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    picArr = [NSMutableArray array];
    
    // 加载数据
    [self loadData];
}


/**
 *  加载数据
 */
- (void)loadData {
    [super loadData];
    
    self.url = @"http://api.shigeten.net/api/Critic/GetCriticList";
    [self loadDataWithParameters:nil opration:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = dict[@"result"];
        
        MDYCritcView *view;
        for (int i = 0; i < arr.count; i++) {
            
            // 创建用来显示电影信息的 view
            view = [[MDYCritcView alloc] initWithFrame:CGRectMake(i*self.contentView.frame.size.width, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
            view.tag = 300 +i;
            
            
            // 将创建的电影信息 view 添加到容器中
            [self.contentView addSubview:view];
            
            // 生成电影信息 model 并将其交给刚才创建的 view
            MDYCriticModel *model = [MDYCriticModel instanceFromDictionary:arr[i]];
            view.criticModel = model;
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            if (![defaults boolForKey:@"first"]) {
                [defaults setBool:YES forKey:@"first"];
                
                [self.nvc showAlertWithText:@"欢迎!左右滑动可以切换条目。点击左上角可以在文章和电影中切换。右上角有:播放、图片、剧评,按钮。感谢您的支持!^_^" time:5];
            }
        }
        
        // 设置容器大小
        self.contentView.contentSize = CGSizeMake(CGRectGetMaxX(view.frame), CGRectGetMaxY(view.frame));
    }];
}

/**
 *  显示相册
 */
- (void)showPhoto {
    int index = (self.contentView.contentOffset.x +5) /SCREEN_WIDTH;
    MDYCritcView *view = (id) [self.contentView viewWithTag:300 +index];
    
    if (view) {
        [picArr removeAllObjects];
        for (int i = 1; i <= 5; i++) {
            NSString * url =[view.detailModel valueForKey:[NSString stringWithFormat:@"image%d", i]];
            
            if (url.length) {
                
                url = [IMAGE_URL_PRI stringByAppendingString:url];
                [picArr addObject:[NSURL URLWithString:url]];
            }
        }
        
        SDPhotoBrowser *brower = [[SDPhotoBrowser alloc] init];
        brower.sourceImagesContainerView =view;
        brower.imageCount = picArr.count;
        brower.currentImageIndex = 0;
        brower.delegate = self;
        [brower show];
    } else {
        [self.nvc showAlertWithText:@"正在加载数据，稍等" time:1];
    }
}


/**
 *  播放电影
 */
- (void)palyMovie {
    int index = (self.contentView.contentOffset.x +5) /SCREEN_WIDTH;
    MDYCritcView *view = (id) [self.contentView viewWithTag:300 +index];
    
    if (view) {
        if (view.detailModel.urlforplay.length) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:view.detailModel.urlforplay]];
        } else {
            [self.nvc showAlertWithText:@"当前影片没有播放地址数据" time:2];
        }
    }
}

/**
 *  以模态进入文章阅读页
 */
- (void)showArticleVc {
    
    MDYArticleViewController *vc = [MDYArticleViewController sharedAritcleViewController];
    
//    self.nvc.modalTransitionStyle = ;
    
    vc.nvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self.nvc presentViewController:vc.nvc animated:YES completion:nil];
    
}


- (void)showReview {
    int index = (self.contentView.contentOffset.x +5) /SCREEN_WIDTH;
    MDYCritcView *view = (id) [self.contentView viewWithTag:300 +index];
    
    MDYReviewView *Review = [[MDYReviewView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    NSMutableString * text = [NSMutableString string];
    for (int i = 3; i <=5; i++) {
        NSString *key = [NSString stringWithFormat:@"text%d",i];
        key = [view.detailModel valueForKey:key];
        [text appendString:key];
    }
    [Review setText:text author:view.detailModel.author];
    
    [Review showWithView:self.nvc.view];
}


#pragma mark - 协议中的方法

/**
 *  响应navigationBar 上的按钮点击事件
 *
 *  @param navigationBar 分发事件的 Bar
 *  @param type          触发事件的 按钮
 */
- (void)navigationBar:(MDYNavigationBar *)navigationBar ItemClicked:(MDY_NVC_BTN_TYPE)type {
    
    
    
    switch (type) {
        
        // 处理左边 item 点击事件
        case MDY_NVC_LEFT_BTN:{
            
            [self showArticleVc];
            
            break;
        }
            
        case MDY_NVC_PLAY_BTN:{
            
            [self palyMovie];
            
            break;
        }
            
        case MDY_NVC_PIC_BTN:{
            [self showPhoto];
            
            break;
        }
            
        case MDY_NVC_REVIEW_BTN:{
            [self showReview];
            
            break;
        }
        default:
            break;
    }
}


- (UIImage *)photoBrowser:(SDPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index {
    return [UIImage imageNamed:@"pleaseHold"];
}

- (NSURL *)photoBrowser:(SDPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index {
    return picArr[index];
}

@end
