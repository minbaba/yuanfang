#import "MDYPicItem.h"

@implementation MDYPicItem
+ (MDYPicItem *)instanceFromDictionary:(NSDictionary *)aDictionary {

    MDYPicItem *instance = [[MDYPicItem alloc] init];
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
        [self setValue:value forKey:@"mDYPicItemId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}



@end
