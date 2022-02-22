#import "RollbarClient.h"
#import "RollbarJavascript.h"

#pragma mark - data field keys

static NSString *const DFK_CPU = @"cpu";
static NSString *const DFK_JAVASCRIPT = @"javascript";

@implementation RollbarClient

#pragma mark - Properties

-(nullable NSString *)cpu {
    return [self getDataByKey:DFK_CPU];
}

-(void)setCpu:(nullable NSString *)cpu {
    [self setData:cpu byKey:DFK_CPU];
}

-(nullable RollbarJavascript *)javaScript {
    id data = [self getDataByKey:DFK_JAVASCRIPT];
    if (data) {
        return [[RollbarJavascript alloc] initWithDictionary:data];
    }
    return nil;
}

-(void)setJavaScript:(nullable RollbarJavascript *)javaScript {
    [self setData:javaScript.jsonFriendlyData byKey:DFK_JAVASCRIPT];
}

#pragma mark - Initializers

-(instancetype)initWithCpu:(nullable NSString *)cpu
                javaScript:(nullable RollbarJavascript *)javaScript {
    
    self = [super initWithDictionary:@{
        DFK_CPU: cpu ? cpu: [NSNull null],
        DFK_JAVASCRIPT: javaScript ? javaScript.jsonFriendlyData : [NSNull null]
    }];
    return self;
}

@end
