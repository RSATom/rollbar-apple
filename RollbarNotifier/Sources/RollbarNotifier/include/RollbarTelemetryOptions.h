@import RollbarCommon;

@class RollbarScrubbingOptions;

NS_ASSUME_NONNULL_BEGIN

@interface RollbarTelemetryOptions : RollbarDTO

#pragma mark - properties
@property (nonatomic) BOOL enabled;
@property (nonatomic) BOOL captureLog;
@property (nonatomic) BOOL captureConnectivity;
@property (nonatomic) NSUInteger maximumTelemetryData;
@property (nonatomic, strong) RollbarScrubbingOptions *viewInputsScrubber;

#pragma mark - initializers

- (instancetype)initWithEnabled:(BOOL)enabled
                     captureLog:(BOOL)captureLog
            captureConnectivity:(BOOL)captureConnectivity
             viewInputsScrubber:(RollbarScrubbingOptions *)viewInputsScrubber;
//NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithEnabled:(BOOL)enabled
                     captureLog:(BOOL)captureLog
            captureConnectivity:(BOOL)captureConnectivity;
- (instancetype)initWithEnabled:(BOOL)enabled;

@end

NS_ASSUME_NONNULL_END
