@import RollbarCommon;

NS_ASSUME_NONNULL_BEGIN

@interface RollbarDestination : RollbarDTO

#pragma mark - properties

@property (nonatomic, copy) NSString *endpoint;
@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, copy) NSString *environment;

#pragma mark - initializers

- (instancetype)initWithEndpoint:(NSString *)endpoint
                     accessToken:(NSString *)accessToken
                     environment:(NSString *)environment;
- (instancetype)initWithAccessToken:(NSString *)accessToken
                        environment:(NSString *)environment;
- (instancetype)initWithAccessToken:(NSString *)accessToken;

@end

NS_ASSUME_NONNULL_END
