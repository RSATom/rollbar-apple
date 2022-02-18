#import "RollbarCallStackFrameContext.h"

static NSString * const DFK_PRE_CODE_LINES = @"pre";
static NSString * const DFK_POST_CODE_LINES = @"post";

@implementation RollbarCallStackFrameContext

#pragma mark - Properties

-(nullable NSArray<NSString *> *)preCodeLines{
    return [self getDataByKey:DFK_PRE_CODE_LINES];
}

-(void)setPreCodeLines:(nullable NSArray<NSString *> *)preCodeLines {
    [self setData:preCodeLines byKey:DFK_PRE_CODE_LINES];
}

-(nullable NSArray<NSString *> *)postCodeLines{
    return [self getDataByKey:DFK_POST_CODE_LINES];
}

-(void)setPostCodeLines:(nullable NSArray<NSString *> *)postCodeLines {
    [self setData:postCodeLines byKey:DFK_POST_CODE_LINES];
}

#pragma mark - Initializers

-(instancetype)initWithPreCodeLines:(nullable NSArray<NSString *> *)pre
                     postCodeLines:(nullable NSArray<NSString *> *)post {
    
    self = [super initWithDictionary:@{
        DFK_PRE_CODE_LINES: pre ? pre : [NSNull null],
        DFK_POST_CODE_LINES: post ? post : [NSNull null]
    }];
    return self;
}

@end
