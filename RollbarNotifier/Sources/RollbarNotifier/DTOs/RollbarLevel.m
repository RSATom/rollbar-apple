#import "RollbarLevel.h"

@implementation RollbarLevelUtil

+ (NSString *) RollbarLevelToString:(RollbarLevel)value; {

    switch (value) {
        case RollbarLevel_Debug:
            return @"debug";
        case RollbarLevel_Warning:
            return @"warning";
        case RollbarLevel_Critical:
            return @"critical";
        case RollbarLevel_Error:
            return @"error";
        default:
            return @"info";
    }
}

+ (RollbarLevel) RollbarLevelFromString:(nullable NSString *)value {
    
    if (nil == value) {
        
        return RollbarLevel_Info; // default case...
    }
    else if (NSOrderedSame == [value caseInsensitiveCompare:@"debug"]) {

        return RollbarLevel_Debug;
    }
    else  if (NSOrderedSame == [value caseInsensitiveCompare:@"warning"]) {

        return RollbarLevel_Warning;
    }
    else  if (NSOrderedSame == [value caseInsensitiveCompare:@"critical"]) {

        return RollbarLevel_Critical;
    }
    else  if (NSOrderedSame == [value caseInsensitiveCompare:@"error"]) {

        return RollbarLevel_Error;
    }
    else {

        return RollbarLevel_Info; // default case...
    }
}

@end

