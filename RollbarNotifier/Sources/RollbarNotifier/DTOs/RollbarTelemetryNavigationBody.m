#import "RollbarTelemetryNavigationBody.h"

#pragma mark - constants

#pragma mark - data field keys

static NSString * const DFK_FROM = @"from";
static NSString * const DFK_TO = @"to";

#pragma mark - class implementation

@implementation RollbarTelemetryNavigationBody

#pragma mark - initializers

-(instancetype)initWithFromLocation:(nonnull NSString *)from
                         toLocation:(nonnull NSString *)to
                          extraData:(nullable NSDictionary<NSString *, id> *)extraData {

    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    if (extraData) {
        [data addEntriesFromDictionary:extraData];
    }
    [data setObject:from forKey:DFK_FROM];
    [data setObject:to forKey:DFK_TO];
    self = [super initWithDictionary:data];
    return self;
}

-(instancetype)initWithFromLocation:(nonnull NSString *)from
                         toLocation:(nonnull NSString *)to {
    return [self initWithFromLocation:from
                           toLocation:to
                            extraData:nil];
}

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)data {

    return [super initWithDictionary:data];
}

#pragma mark - property accessors

- (NSString *)from {
    NSString *result = [self safelyGetStringByKey:DFK_FROM];
    return result;
}

- (void)setFrom:(NSString *)value {
    [self setString:value forKey:DFK_FROM];
}

- (NSString *)to {
    NSString *result = [self safelyGetStringByKey:DFK_TO];
    return result;
}

- (void)setTo:(NSString *)value {
    [self setString:value forKey:DFK_TO];
}

@end
