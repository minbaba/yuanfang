//
//  MDYArticleView.h
//  YuanFang
//
//  Created by dell on 15/10/16.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDYArticleItem.h"
#import "MDYArticleContentModel.h"
#import "MDYBaseView.h"

@interface MDYArticleView : MDYBaseView

@property (strong, nonatomic) MDYArticleItem *artticleItem;
@property (strong, nonatomic) MDYArticleContentModel *detailModel;
@end
