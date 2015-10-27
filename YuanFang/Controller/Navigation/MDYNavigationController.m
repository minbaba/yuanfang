//
//  MDYNavigationController.m
//  YuanFang
//
//  Created by dell on 15/10/15.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import "MDYNavigationController.h"
#import "MDYAlertView.h"

@interface MDYNavigationController (){
    
}

@end

@implementation MDYNavigationController



- (void)showAlertWithText:(NSString *)text time:(int)time {
    
    MDYAlertView *alert = [MDYAlertView sharedAlert];
    [self.view addSubview:alert];

    [alert showWithText:text];
    [alert performSelector:@selector(hide) withObject:nil afterDelay:time];
}


@end
