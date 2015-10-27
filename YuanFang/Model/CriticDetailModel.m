#import "CriticDetailModel.h"

@implementation CriticDetailModel
+ (CriticDetailModel *)instanceFromDictionary:(NSDictionary *)aDictionary {

    CriticDetailModel *instance = [[CriticDetailModel alloc] init];
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
        [self setValue:value forKey:@"criticDetailModelId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}

- (void)setValue:(id)value forKey:(NSString *)key {
    if ([key isEqualToString:@"text2"]) {
        NSString *newValue  = [value stringByReplacingOccurrencesOfString:@"剧情简介\r\n\r\n" withString:@""];
        newValue = [newValue stringByReplacingOccurrencesOfString:@"，" withString:@",\n"];
        newValue = [newValue stringByReplacingOccurrencesOfString:@"。" withString:@"。\n"];
        [super setValue:newValue forKey:key];
    } else {
        [super setValue:value forKey:key];
    }
}



@end
