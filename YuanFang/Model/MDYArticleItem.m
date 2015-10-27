#import "MDYArticleItem.h"

@implementation MDYArticleItem 

+ (MDYArticleItem *)instanceFromDictionary:(NSDictionary *)aDictionary {

    MDYArticleItem *instance = [[MDYArticleItem alloc] init];
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
        [self setValue:value forKey:@"mDYArticleItemId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}



@end
