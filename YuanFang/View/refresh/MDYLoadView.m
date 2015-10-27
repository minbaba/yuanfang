//
//  MDYRefreshView.m
//  YuanFang
//
//  Created by dell on 15/10/16.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import "MDYLoadView.h"

@implementation MDYLoadView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"MDYLoadView" owner:self options:nil];
        
        self.view.frame = self.bounds;
        [self addSubview:self.view];
    }
    return self;
}

- (void)load {
    self.refrehBtn.hidden = YES;
    self.imageView.hidden = NO;
    
    
    NSMutableArray *imageArr = [NSMutableArray arrayWithCapacity:90];
    for (int i = 1; i <= 46; i++) {
        
        [imageArr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"load_%02d", i]]];
    }
    
    self.imageView.animationImages = imageArr;
    self.imageView.animationDuration = 2.0f;
    [self.imageView startAnimating];
}

- (void)refresh {
    self.refrehBtn.hidden = NO;
    self.imageView.hidden = YES;
    [self.imageView stopAnimating];
    self.imageView.animationImages = nil;
}

- (IBAction)refreshBtnClicked:(id)sender {
    if ([self.delegate respondsToSelector:@selector(loadViewRefresh:)]) {
        [self.delegate loadViewRefresh:self];
    }
}


@end
