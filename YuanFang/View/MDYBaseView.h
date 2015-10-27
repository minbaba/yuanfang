//
//  MDYBaseView.h
//  YuanFang
//
//  Created by dell on 15/10/16.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMTumblrHud.h"

@class MDYBaseView;

@protocol MDYBaseViewDelegate <NSObject>

@optional


@end


@interface MDYBaseView : UIScrollView {
    AMTumblrHud *hud;
    UIView *maskView;
}

@property (copy, nonatomic) NSString * url;

- (void)loadData;

- (void)loadDataWithParameters:(NSDictionary *)parameters opration:(void (^)(id responseObject))success;

@end
