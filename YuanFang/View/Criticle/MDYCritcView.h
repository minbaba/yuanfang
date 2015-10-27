//
//  MDYCritcView.h
//  YuanFang
//
//  Created by dell on 15/10/15.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDYCriticModel.h"
#import "CriticDetailModel.h"
#import "MDYBaseView.h"

@interface MDYCritcView : MDYBaseView

@property (strong, nonatomic) MDYCriticModel *criticModel;
@property (strong, nonatomic) CriticDetailModel *detailModel;

@end
