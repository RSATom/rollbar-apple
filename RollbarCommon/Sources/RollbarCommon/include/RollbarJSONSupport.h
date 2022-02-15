#ifndef RollbarJSONSupport_h
#define RollbarJSONSupport_h

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

/// JSON de/serialization protocol
@protocol RollbarJSONSupport <NSObject>

/// Internal JSON serializable "data store"
@property (readonly) NSMutableDictionary *jsonFriendlyData;

#pragma mark - via JSON-friendly NSData

/// Serialize into JSON-friendly NSData instance
- (nullable NSData *)serializeToJSONData;

/// Desrialize from JSON-friendly NSData instance
/// @param jsonData JSON-friendly NSData instance
- (BOOL)deserializeFromJSONData:(NSData *)jsonData;

#pragma mark - via JSON string

/// Serialize into a JSON string
- (nullable NSString *)serializeToJSONString;

/// Deserialize from a JSON string
/// @param jsonString JSON string
- (BOOL)deserializeFromJSONString:(NSString *)jsonString;

#pragma mark - Initializers

/// Initialize this DTO instance with valid JSON data string seed
/// @param jsonString valid JSON data string seed
- (instancetype)initWithJSONString:(NSString *)jsonString;

/// Initialize this DTO instance with valid JSON  NSData seed
/// @param data valid JSON NSData seed
- (instancetype)initWithJSONData:(NSData *)data;

/// Initialize this DTO instance with valid JSON NSDictionary seed
/// @param data valid JSON NSDictionary seed
- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)data;

/// Initialize this DTO instance with valid JSON NSArray seed
/// @param data valid JSON NSArray seed
- (instancetype)initWithArray:(NSArray *)data;

@end

NS_ASSUME_NONNULL_END

#endif //RollbarJSONSupport_h
