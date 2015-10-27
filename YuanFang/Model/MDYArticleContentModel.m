
#import "MDYArticleContentModel.h"

@implementation MDYArticleContentModel

+ (MDYArticleContentModel *)instanceFromDictionary:(NSDictionary *)aDictionary {

    MDYArticleContentModel *instance = [[MDYArticleContentModel alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"mDYArticleContentModelId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}



@end
