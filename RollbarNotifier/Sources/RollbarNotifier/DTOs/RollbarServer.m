#import "RollbarServer.h"

static NSString *const DFK_CPU = @"cpu";

@implementation RollbarServer

#pragma mark - Properties

-(nullable NSString *)cpu {
    return [self getDataByKey:DFK_CPU];
}

-(void)setCpu:(nullable NSString *)cpu {
    [self setData:cpu byKey:DFK_CPU];
}

#pragma mark - Initializers

- (instancetype)initWithCpu:(nullable NSString *)cpu
                       host:(nullable NSString *)host
                       root:(nullable NSString *)root
                     branch:(nullable NSString *)branch
                codeVersion:(nullable NSString *)codeVersion {
    
    self = [super initWithHost:host
                          root:root
                        branch:branch
                   codeVersion:codeVersion];
    if (self) {
        [self mergeDataDictionary:@{
            DFK_CPU: cpu ? cpu : [NSNull null]
        }];
    }
    return self;
}

- (instancetype)initWithCpu:(nullable NSString *)cpu
               serverConfig:(nullable RollbarServerConfig *)serverConfig {
    
    if (serverConfig) {
        self = [super initWithDictionary:serverConfig.jsonFriendlyData];
    }
    
    if (self) {
        [self mergeDataDictionary:@{
            DFK_CPU: cpu ? cpu : [NSNull null]
        }];
    }
    
    return self;
 }


@end
