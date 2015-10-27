//
//  MDYReviewView.m
//  YuanFang
//
//  Created by dell on 15/10/17.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import "MDYReviewView.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@implementation MDYReviewView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"MDYReviewView" owner:self options:nil];
        contentView.frame = self.bounds;
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.8];
        
        [self addSubview:contentView];
        
        self.alpha = 0;
    }
    return self;
}


- (void)setText:(NSString *)text author:(NSString *)author {
    authorLabel.text = author;
    [authorLabel sizeToFit];
    
    contentLabel.text = text;
    [contentLabel sizeToFit];
    
    [self performSelector:@selector(resize) withObject:nil afterDelay:0.1f];
}

- (void)resize {
    contentView.frame = CGRectMake(0, 0, self.frame.size.width, CGRectGetMaxY(contentLabel.frame) +20);
    self.contentSize = contentView.frame.size;
}

- (void)showWithView:(UIView *)view {
    [view addSubview:self];
    
    CGRect rect = view.bounds;
    rect.origin.y += 20;
    rect.size.height -= 20;
    
    [UIView animateWithDuration:0.3f animations:^{
        self.frame = rect;
        self.alpha =1;
    }];
}

- (IBAction)hide:(id)sender {
    CGRect rect = self.frame;
    rect.origin.y = SCREEN_HEIGHT;
    
    [UIView animateWithDuration:0.3f animations:^{
        self.frame = rect;
        self.alpha =0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}



@end
