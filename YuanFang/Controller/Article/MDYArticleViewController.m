//
//  MDYArticleViewController.m
//  YuanFang
//
//  Created by dell on 15/10/15.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import "MDYArticleViewController.h"
#import "MDYNavigationController.h"
#import "MDYCriticViewController.h"
#import "MDYArticleView.h"
#import "MDYPicItem.h"
#import "SDPhotoBrowser.h"

@interface MDYArticleViewController () <MDYNavigationBarDelegaete, SDPhotoBrowserDelegate> {
    NSMutableArray *picArr;
}

@end

@implementation MDYArticleViewController

+ (instancetype)sharedAritcleViewController {
    static MDYArticleViewController *vc = nil;
    
    if (!vc) {
        vc = [[MDYArticleViewController alloc] init];
        
        vc.nvc = [[MDYNavigationController alloc] initWithNavigationBarClass:[MDYNavigationBar class] toolbarClass:[UIToolbar class]];
        vc.nvc.viewControllers = @[vc];
        vc.nvBar = (id) vc.nvc.navigationBar;
    }
    
    return vc;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    picArr = [NSMutableArray array];
    self.nvBar.myDelegate = self;
    
    [self.nvBar.leftBtn setBackgroundImage:[UIImage imageNamed:@"ying"] forState:UIControlStateNormal];
    self.nvBar.playBtn.hidden = YES;
    
    // 加载数据
    [self loadData];
    
}

/**
 *  加载数据
 */
- (void)loadData {
    
    [super loadData];
    
    [self loadArticleData];
    
    [self loadPicData];
}

/**
 *  加载文章数据
 */
- (void)loadArticleData {
    
    self.url = @"http://api.shigeten.net/api/Novel/GetNovelList";
    [self loadDataWithParameters:nil opration:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = dict[@"result"];
        
        MDYArticleView *aView;
        for (int i = 0; i < arr.count; i++) {
            
            // 创建用来显示文章信息的 view
            aView = [[MDYArticleView alloc] initWithFrame:CGRectMake(i*self.contentView.frame.size.width, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
            aView.tag = 300 +i;
            
            // 将创建的文章信息 view 添加到容器中
            [self.contentView addSubview:aView];
            
            // 生成文章信息 model 并将其交给刚才创建的 view
            aView.artticleItem = [MDYArticleItem instanceFromDictionary:arr[i]];
        }
        
        // 设置容器大小
        self.contentView.contentSize = CGSizeMake(CGRectGetMaxX(aView.frame), CGRectGetMaxY(aView.frame));
    }];
    
    
}

- (void)loadPicData {
    // 加载图片数据
    self.url = @"http://api.shigeten.net/api/Diagram/GetDiagramList";
    [self loadDataWithParameters:nil opration:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = dict[@"result"];
        
        for (NSDictionary *obj in arr) {
            MDYPicItem *item = [MDYPicItem instanceFromDictionary:obj];
            if (item.image.length) {
                NSString *url = [IMAGE_URL_PRI stringByAppendingString:item.image];
                [picArr addObject:[NSURL URLWithString:url]];
            }
        }
    }];
}



/**
 *  显示相册
 */
- (void)showPhoto {
    
    int index = (self.contentView.contentOffset.x +5) /SCREEN_WIDTH;
    MDYArticleView *view = (id) [self.contentView viewWithTag:300 +index];
    
    if (picArr.count && view) {
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


- (void)navigationBar:(MDYNavigationBar *)navigationBar ItemClicked:(MDY_NVC_BTN_TYPE)type {
    switch (type) {
        case MDY_NVC_LEFT_BTN:{
            
            [self.nvc dismissViewControllerAnimated:YES completion:nil];
            break;
        }
        case MDY_NVC_PIC_BTN:{
            
            [self showPhoto];
            
            break;
        }
        case MDY_NVC_REVIEW_BTN:{
            
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
    
    if (index < 0 || index >= picArr.count) {
        return picArr[0];
    }
    
    return picArr[index];
}

@end
