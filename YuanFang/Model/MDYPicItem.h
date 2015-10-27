#import <Foundation/Foundation.h>

@interface MDYPicItem : NSObject


@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSNumber *publishtime;
@property (nonatomic, copy) NSNumber *mDYPicItemId;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSNumber *type;

+ (MDYPicItem *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
