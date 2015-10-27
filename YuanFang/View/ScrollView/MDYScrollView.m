//
//  MDYScrollView.m
//  YuanFang
//
//  Created by dell on 15/10/16.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import "MDYScrollView.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@implementation MDYScrollView {
    UILabel *leftLabel;
    UILabel *rightLabel;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 300)];
        leftLabel.textAlignment = NSTextAlignmentCenter;
        leftLabel.font = [UIFont systemFontOfSize:15];
        leftLabel.text = @"已\n经\n是\n第\n一\n页\n啦\n!";
        leftLabel.textColor = [UIColor lightGrayColor];
        leftLabel.numberOfLines = 0;
        [leftLabel sizeToFit];
        leftLabel.center = CGPointMake( -50, 0);
        [self addSubview:leftLabel];
        
        rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 300)];
        rightLabel.textAlignment = NSTextAlignmentCenter;
        rightLabel.font = [UIFont systemFontOfSize:15];
        rightLabel.text = @"已\n经\n是\n最\n后\n一\n页\n啦\n!";
        rightLabel.textColor = [UIColor lightGrayColor];
        rightLabel.numberOfLines = 0;
        [rightLabel sizeToFit];
        rightLabel.center = CGPointMake( -50, 0);
        [self addSubview:rightLabel];
    }
    return self;
}


- (void)setContentSize:(CGSize)contentSize {
    [super setContentSize:contentSize];
    
    rightLabel.center = CGPointMake(self.contentSize.width + 30, self.bounds.size.height / 2.0f);
}

- (void)setContentOffset:(CGPoint)contentOffset {
    [super setContentOffset:contentOffset];
    
    if (contentOffset.x < 0) {
        leftLabel.alpha = (-contentOffset.x -10) /50.0f;
        float size = 15 +(-contentOffset.x -10) / 5;
        leftLabel.font = [UIFont systemFontOfSize:size];
        [leftLabel sizeToFit];
        CGRect rect = leftLabel.frame;
        rect.size.width = size;
        leftLabel.frame = rect;
        
        leftLabel.center = CGPointMake(- size, self.bounds.size.height / 2.0f);
    } else if (contentOffset.x > self.contentSize.width - SCREEN_WIDTH) {
        rightLabel.alpha = (contentOffset.x - (self.contentSize.width - SCREEN_WIDTH) -10) /50.0f;
        
        float size = 15 +(contentOffset.x - (self.contentSize.width - SCREEN_WIDTH) -10) / 5;
        rightLabel.font = [UIFont systemFontOfSize:size];
        [rightLabel sizeToFit];
        CGRect rect = rightLabel.frame;
        rect.size.width = size;
        rightLabel.frame = rect;
        
        rightLabel.center = CGPointMake(self.contentSize.width + size, self.bounds.size.height / 2.0f);
    }
}

@end
