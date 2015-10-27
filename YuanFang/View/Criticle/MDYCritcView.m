//
//  MDYCritcView.m
//  YuanFang
//
//  Created by dell on 15/10/15.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import "MDYCritcView.h"
#import "CriticDetailModel.h"
#import "UIImageView+WebCache.h"
#import "AFNetworking.h"


#define IMAGE_URL_PRI @"http://images.shigeten.net/"

@interface MDYCritcView () {
    
    IBOutlet UIView *contentView;
    
    
    __weak IBOutlet UIImageView *iv;
    
    __weak IBOutlet UILabel *titleLabel;
    
    __weak IBOutlet UILabel *summaryLabel;
    
    
    __weak IBOutlet UILabel *juqingLabel;
    
}

@end

@implementation MDYCritcView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        [[NSBundle mainBundle] loadNibNamed:@"MDYCritcView" owner:self options:nil];
        contentView.frame = CGRectMake(0, 0, self.frame.size.width, 0);
        self.contentSize = contentView.frame.size;
        
        [self addSubview:contentView];
        
    }
    return self;
}

- (void)setCriticModel:(MDYCriticModel *)criticModel {
    _criticModel = criticModel;
    
    [iv sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@", IMAGE_URL_PRI, criticModel.image]] placeholderImage:[UIImage imageNamed:@"pleaseHold"]];
    
    
    
    titleLabel.text = criticModel.title;
    [titleLabel sizeToFit];
    
    summaryLabel.text = criticModel.summary;
    [summaryLabel sizeToFit];
    
    
    
    [self loadData];
    
}

- (void)loadData {
    [super loadData];
    
    self.url = @"http://api.shigeten.net/api/Critic/GetCriticContent";
    
    [self loadDataWithParameters:@{@"id":_criticModel.criticModelId} opration:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        self.detailModel = [CriticDetailModel instanceFromDictionary:dict];
        
        juqingLabel.text = self.detailModel.text2;
        [self performSelector:@selector(resize) withObject:nil afterDelay:0.1f];
    }];
}


- (void)resize {
    contentView.frame = CGRectMake(0, 0, self.frame.size.width, CGRectGetMaxY(juqingLabel.frame) +20);
    self.contentSize = contentView.frame.size;
}


@end
