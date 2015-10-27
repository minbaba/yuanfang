#import "MDYCriticModel.h"

@implementation MDYCriticModel

+ (MDYCriticModel *)instanceFromDictionary:(NSDictionary *)aDictionary {

    MDYCriticModel *instance = [[MDYCriticModel alloc] init];
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
        [self setValue:value forKey:@"criticModelId"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}



@end
