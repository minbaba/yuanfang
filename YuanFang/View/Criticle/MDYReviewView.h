//
//  MDYReviewView.h
//  YuanFang
//
//  Created by dell on 15/10/17.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDYReviewView : UIScrollView {
    
    IBOutlet UIView *contentView;
    
    __weak IBOutlet UILabel *authorLabel;
    
    __weak IBOutlet UILabel *contentLabel;
}

- (void)setText:(NSString *)text author:(NSString *)author;

- (void)showWithView:(UIView *)view;


@end
