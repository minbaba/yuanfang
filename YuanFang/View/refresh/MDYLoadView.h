//
//  MDYRefreshView.h
//  YuanFang
//
//  Created by dell on 15/10/16.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDYLoadView;

@protocol MDYLoadViewDelegate <NSObject>

@optional

- (void)loadViewRefresh:(MDYLoadView *)view;

@end

@interface MDYLoadView : UIView

@property (weak, nonatomic) IBOutlet UIButton *refrehBtn;
@property (strong, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;



@property (assign, nonatomic) id<MDYLoadViewDelegate> delegate;

- (void)load;

- (void)refresh;

@end
