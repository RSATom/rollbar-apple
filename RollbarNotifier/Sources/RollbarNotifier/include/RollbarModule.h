@import RollbarCommon;

NS_ASSUME_NONNULL_BEGIN

@interface RollbarModule : RollbarDTO

#pragma mark - properties

// Optional: name
// Name of the library
@property (nonatomic, copy, nullable) NSString *name;

// Optional: version
// Library version string
@property (nonatomic, copy, nullable) NSString *version;

#pragma mark - initializers

- (instancetype)initWithName:(nullable NSString *)name
                     version:(nullable NSString *)version;

- (instancetype)initWithName:(nullable NSString *)name;

@end

NS_ASSUME_NONNULL_END
