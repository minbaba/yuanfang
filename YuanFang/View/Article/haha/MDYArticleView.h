//
//  MDYArticleView.h
//  YuanFang
//
//  Created by dell on 15/10/15.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDYArticleItem.h"
#import "MDYArticleContentModel.h"

@interface MDYArticleView : UIScrollView

@property (strong, nonatomic) MDYArticleItem *artticleItem;
@property (strong, nonatomic) MDYArticleContentModel *detailModel;


@end
