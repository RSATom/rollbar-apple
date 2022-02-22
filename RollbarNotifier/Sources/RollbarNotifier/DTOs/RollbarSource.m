#import "RollbarSource.h"

@implementation RollbarSourceUtil

+ (NSString *) RollbarSourceToString:(RollbarSource)value {
    
    switch (value) {
        case RollbarSource_Client:
            return @"client";
        case RollbarSource_Server:
            return @"server";
        default:
            return @"UNKNOWN";
    }
}

+ (RollbarSource) RollbarSourceFromString:(nullable NSString *)value {
    
    if (nil == value) {
        
        return RollbarSource_Server; // default case...
    }
    else if (NSOrderedSame == [value caseInsensitiveCompare:@"client"]) {

        return RollbarSource_Client;
    }
    else  if (NSOrderedSame == [value caseInsensitiveCompare:@"server"]) {

        return RollbarSource_Server;
    }
    else {

        return RollbarSource_Server; // default case...
    }
}

@end
