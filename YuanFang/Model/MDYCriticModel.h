#import <Foundation/Foundation.h>

@interface MDYCriticModel : NSObject
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSNumber *publishtime;
@property (nonatomic, copy) NSNumber *criticModelId;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSNumber *type;

+ (MDYCriticModel *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
