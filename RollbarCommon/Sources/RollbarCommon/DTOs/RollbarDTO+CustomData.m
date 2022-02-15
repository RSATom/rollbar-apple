#import "RollbarDTO+CustomData.h"

@implementation RollbarDTO (CustomData)

- (void)addKeyed:(NSString *)aKey DataTransferObject:(RollbarDTO *)aValue {
    [self->_data setValue:aValue forKey:aKey];
}

- (void)addKeyed:(NSString *)aKey String:(NSString *)aValue {
    [self->_data setValue:aValue.mutableCopy forKey:aKey];
}

- (void)addKeyed:(NSString *)aKey Number:(NSNumber *)aValue {
    [self->_data setValue:aValue forKey:aKey];
}

- (void)addKeyed:(NSString *)aKey Array:(NSArray *)aValue {
    [self->_data setValue:aValue.mutableCopy forKey:aKey];
}

- (void)addKeyed:(NSString *)aKey Dictionary:(NSDictionary *)aValue {
    [self->_data setValue:aValue.mutableCopy forKey:aKey];
}

- (void)addKeyed:(NSString *)aKey Placeholder:(NSNull *)aValue {
    [self->_data setValue:aValue.mutableCopy forKey:aKey];
}

- (BOOL)tryAddKeyed:(NSString *)aKey Object:(NSObject *)aValue {
    if ([RollbarDTO isTransferableDataValue:aValue]) {
        self->_data[aKey] = aValue;
        return YES;
    }
    return NO;
}

@end
