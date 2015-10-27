//
//  MDYArticleView.m
//  YuanFang
//
//  Created by dell on 15/10/16.
//  Copyright (c) 2015年 dell. All rights reserved.
//

#import "MDYArticleView.h"
#import "AFNetworking.h"
#import "MDYLoadView.h"

@interface MDYArticleView () {
    
}
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *readTimesLabel;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;



@property (weak, nonatomic) IBOutlet MDYLoadView *loadView;

@end

@implementation MDYArticleView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [[NSBundle mainBundle] loadNibNamed:@"ArticleView" owner:self options:nil];
//        self.contentView.backgroundColor = [UIColor redColor];
        self.contentView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
        
        [self addSubview:self.contentView];
        [self.loadView load];
    }
    return self;
}

- (void)setArtticleItem:(MDYArticleItem *)artticleItem {
    _artticleItem = artticleItem;
    
    [self loadData];

}


- (void)loadData {
    
    [super loadData];
    
    self.url = @"http://api.shigeten.net/api/Novel/GetNovelContent";
    
    [self loadDataWithParameters:@{@"id":[self.artticleItem.mDYArticleItemId stringValue]} opration:^(id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        self.detailModel = [MDYArticleContentModel instanceFromDictionary:dict];
        
        self.titleLabel.text = self.detailModel.title;
        [self.titleLabel sizeToFit];
        
        self.authorLabel.text = self.detailModel.author;
        [self.authorLabel sizeToFit];
        
        self.readTimesLabel.text = [self.detailModel.times stringValue];
        [self.readTimesLabel sizeToFit];
        
        self.contentLabel.text = self.detailModel.text;
        [self.contentLabel sizeToFit];
        
        [self performSelector:@selector(resize) withObject:self afterDelay:0.1f];
    }];
}


- (void)resize {
    self.contentView.frame = CGRectMake(0, 0, self.frame.size.width, CGRectGetMaxY(self.contentLabel.frame) +20);
    self.contentSize = self.contentView.frame.size;
}




@end
