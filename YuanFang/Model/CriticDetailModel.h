#import <Foundation/Foundation.h>

@interface CriticDetailModel : NSObject

@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *authorbrief;
@property (nonatomic, retain) id errMsg;
@property (nonatomic, copy) NSNumber *criticDetailModelId;
@property (nonatomic, copy) NSString *image1;
@property (nonatomic, copy) NSString *image2;
@property (nonatomic, copy) NSString *image3;
@property (nonatomic, copy) NSString *image4;
@property (nonatomic, copy) NSString *image5;
@property (nonatomic, copy) NSString *imageforplay;
@property (nonatomic, copy) NSNumber *publishtime;
@property (nonatomic, copy) NSString *realtitle;
@property (nonatomic, copy) NSNumber *status;
@property (nonatomic, copy) NSString *text1;
@property (nonatomic, copy) NSString *text2;
@property (nonatomic, copy) NSString *text3;
@property (nonatomic, copy) NSString *text4;
@property (nonatomic, copy) NSString *text5;
@property (nonatomic, copy) NSNumber *times;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *titleforplay;
@property (nonatomic, copy) NSString *urlforplay;

+ (CriticDetailModel *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
