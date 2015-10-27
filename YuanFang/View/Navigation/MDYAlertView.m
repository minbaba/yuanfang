//
//  MDYAlertView.m
//  YuanFang
//
//  Created by dell on 15/10/15.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import "MDYAlertView.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height


@implementation MDYAlertView

- (instancetype)init{
    self = [super init];
    
    if (self) {
        
        self.show = NO;
        
        [[NSBundle mainBundle] loadNibNamed:@"MDYAlertView" owner:self options:nil];
        
        self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        self.frame = CGRectMake(0, -self.view.frame.size.height, SCREEN_WIDTH, self.view.frame.size.height);
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7f];
        [self addSubview:self.view];
        
    }
    
    return self;
}

- (void)showWithText:(NSString *)text {
    
    
    if (!self.isShow) {
        
        self.show = YES;
        
        self.textLabel.text = text;
        [self.textLabel sizeToFit];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, CGRectGetMaxY(self.textLabel.frame) +20);
            self.frame = CGRectMake(0, -self.view.frame.size.height, SCREEN_WIDTH, self.view.frame.size.height);
            
            CGRect rect = self.frame;
            rect.origin.y = 0;
            [UIView animateWithDuration:0.3f animations:^{
                self.frame = rect;
            }];
        });
    }
}



- (void)hide {
    CGRect rect = self.frame;
    rect.origin.y = -rect.size.height;
    [UIView animateWithDuration:0.3f animations:^{
        self.frame = rect;
    } completion:^(BOOL finished) {
        self.show = NO;
        
        [self removeFromSuperview];
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self.superview selector:@selector(hide) object:nil];
    [self hide];
}

+ (instancetype)sharedAlert {
    static MDYAlertView *alert = nil;
    
    if (!alert) {
        alert = [[MDYAlertView alloc] init];
    }
    
    return alert;
}

@end
