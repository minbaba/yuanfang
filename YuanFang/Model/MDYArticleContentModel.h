#import <Foundation/Foundation.h>

@interface MDYArticleContentModel : NSObject

@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *authorbrief;
@property (nonatomic, retain) id errMsg;
@property (nonatomic, copy) NSNumber *mDYArticleContentModelId;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSNumber *publishtime;
@property (nonatomic, copy) NSNumber *status;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSNumber *times;
@property (nonatomic, copy) NSString *title;

+ (MDYArticleContentModel *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
