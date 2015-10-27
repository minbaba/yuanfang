//
//  MDYNavigationBar.h
//  EXAM092801 时光网
//
//  Created by dell on 15/9/30.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDYNavigationBar;

typedef enum {
    MDY_NVC_LEFT_BTN =1,
    MDY_NVC_PLAY_BTN,
    MDY_NVC_PIC_BTN,
    MDY_NVC_REVIEW_BTN
} MDY_NVC_BTN_TYPE;

@protocol MDYNavigationBarDelegaete <NSObject>

@optional
- (void)navigationBar:(MDYNavigationBar *)navigationBar ItemClicked:(MDY_NVC_BTN_TYPE)type;

@end



@interface MDYNavigationBar : UINavigationBar

@property (strong, nonatomic) IBOutlet UIView *bar;

@property (weak, nonatomic) IBOutlet UIButton *leftBtn;


@property (weak, nonatomic) IBOutlet UIButton *playBtn;


@property (weak, nonatomic) IBOutlet UIButton *picBtn;

@property (weak, nonatomic) IBOutlet UIButton *reviewBtn;


@property (assign, nonatomic) id<MDYNavigationBarDelegaete> myDelegate;
@end
