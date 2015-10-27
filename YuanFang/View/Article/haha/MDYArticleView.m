//
//  MDYArticleView.m
//  YuanFang
//
//  Created by dell on 15/10/15.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import "MDYArticleView.h"
#import "AFNetworking.h"

@implementation MDYArticleView {
    
    
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
////        [[NSBundle mainBundle] loadNibNamed:@"MDYArticleView" owner:self options:nil];
//        contentView.frame = CGRectMake(0, 0, self.frame.size.width, 0);
//        self.contentSize = contentView.frame.size;
//        
//        [self addSubview:contentView];
    }
    return self;
}

- (void)setArtticleItem:(MDYArticleItem *)artticleItem {
    _artticleItem = artticleItem;
    
    [self loadData];
}


- (void)loadData {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 关闭自动解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    [manager GET:@"http://api.shigeten.net/api/Novel/GetNovelContent" parameters:@{@"id":self.artticleItem.mDYArticleItemId} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        self.detailModel = [MDYArticleContentModel instanceFromDictionary:dict];
        
//        titleLabel.text = self.detailModel.title;
//        [titleLabel sizeToFit];
//        
//        authorLabel.text = self.detailModel.author;
//        [authorLabel sizeToFit];
//        
//        readTime.text = [self.detailModel.times stringValue];
//        [readTime sizeToFit];
//        
//        contentLabel.text = self.detailModel.text;
//        [contentLabel sizeToFit];
        
        
        [self performSelector:@selector(resize) withObject:self afterDelay:0.1f];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    
}


- (void)resize {
    contentView.frame = CGRectMake(0, 0, self.frame.size.width, CGRectGetMaxY(contentLabel.frame) +20);
    self.contentSize = contentView.frame.size;
}




@end
