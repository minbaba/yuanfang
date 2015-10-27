#import <Foundation/Foundation.h>

@interface MDYArticleItem : NSObject

@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSNumber *publishtime;
@property (nonatomic, copy) NSNumber *mDYArticleItemId;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSNumber *type;

+ (MDYArticleItem *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
