//
//  MDYNavigationBar.m
//  EXAM092801 时光网
//
//  Created by dell on 15/9/30.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import "MDYNavigationBar.h"
#import "AppDelegate.h"

@implementation MDYNavigationBar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        for (UIView *view in [self subviews]) {
            if ([view isKindOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
                [view removeFromSuperview];
            }
        }
        
        [self.leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        
        [[NSBundle mainBundle] loadNibNamed:@"NavigationBarBg" owner:self options:nil];
        self.bar.frame = CGRectMake(0, -20, frame.size.width, frame.size.height +20);
        [self addSubview:self.bar];
    }
    return self;
}


- (IBAction)btnClicked:(UIButton *)sender {
    if ([self.myDelegate respondsToSelector:@selector(navigationBar:ItemClicked:)]) {
        [self.myDelegate navigationBar:self ItemClicked: (int)sender.tag - 300];
    }
}




@end
