#import "RollbarAulEntrySnapper.h"

#if TARGET_OS_OSX

@import RollbarCommon;

#import "RollbarAulOSLogEntryLogLevelConverter.h"

API_AVAILABLE(macos(10.15))
API_UNAVAILABLE(ios, tvos, watchos)
@implementation RollbarAulEntrySnapper

- (void)captureOSLogEntry:(nullable OSLogEntry *)entry
             intoSnapshot:(nonnull NSMutableDictionary<NSString *, id> *)snapshot {
    
    if (nil == entry) {
        return;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd 'at' HH:mm:ss.SSSSSSXX"];

    //Basic OSLogEntry properties:
    snapshot[@"aul_date"] = [formatter stringFromDate:entry.date];
    snapshot[@"aul_className"] = entry.rollbar_objectClassName;
    snapshot[@"aul_composedMessage"] = entry.composedMessage;
    //snapShot[@""] = entry.storeCategory;
    
    if ([entry isKindOfClass:[OSLogEntryLog class]]) {
        
        [self captureOSLogEntryLog:(OSLogEntryLog *)entry
                      intoSnapshot:snapshot];
    }
    
    if ([entry isKindOfClass:[OSLogEntryActivity class]]) {
        
        [self captureOSLogEntryActivity:(OSLogEntryActivity *)entry
                           intoSnapshot:snapshot];
    }
    
    if ([entry isKindOfClass:[OSLogEntrySignpost class]]) {
        
        [self captureOSLogEntrySignpost:(OSLogEntrySignpost *)entry
                           intoSnapshot:snapshot];
    }
    
    if ([entry conformsToProtocol:@protocol(OSLogEntryFromProcess)]) {
        
        [self captureOSLogEntryFromProcess:(OSLogEntry<OSLogEntryFromProcess> *)entry
                              intoSnapshot:snapshot];
    }
    
    if ([entry conformsToProtocol:@protocol(OSLogEntryWithPayload)]) {
        
        [self captureOSLogEntryWithPayload:(OSLogEntry<OSLogEntryWithPayload> *)entry
                              intoSnapshot:snapshot];
    }
}

- (void)captureOSLogEntryLog:(nullable OSLogEntryLog *)entry
                intoSnapshot:(nonnull NSMutableDictionary<NSString *, id> *)snapshot {
    
    if (nil == entry) {
        return;
    }
    
    snapshot[@"aul_level"] = [RollbarAulOSLogEntryLogLevelConverter OSLogEntryLogLevelToString:entry.level];
}

- (void)captureOSLogEntryActivity:(nullable OSLogEntryActivity *)entry
                     intoSnapshot:(nonnull NSMutableDictionary<NSString *, id> *)snapshot {

    if (nil == entry) {
        return;
    }
    
    snapshot[@"aul_parentActivityIdentifier"] = [NSNumber numberWithUnsignedLongLong:entry.parentActivityIdentifier];
}

- (void)captureOSLogEntrySignpost:(nullable OSLogEntrySignpost *)entry
                     intoSnapshot:(nonnull NSMutableDictionary<NSString *, id> *)snapshot {

    if (nil == entry) {
        return;
    }
    
    snapshot[@"aul_signpostIdentifier"] = [NSNumber numberWithUnsignedLongLong:entry.signpostIdentifier];
    snapshot[@"aul_signpostName"] = entry.signpostName;
    snapshot[@"aul_signpostType"] = [NSNumber numberWithInteger:entry.signpostType];
}

- (void)captureOSLogEntryFromProcess:(nullable OSLogEntry<OSLogEntryFromProcess> *)entry
                        intoSnapshot:(nonnull NSMutableDictionary<NSString *, id> *)snapshot {

    if (nil == entry) {
        return;
    }
    
    snapshot[@"aul_activityIdentifier"] = [NSNumber numberWithUnsignedLongLong:entry.activityIdentifier];
    snapshot[@"aul_process"] = entry.process;
    snapshot[@"aul_processIdentifier"] = [NSNumber numberWithInt:entry.processIdentifier];
    snapshot[@"aul_sender"] = entry.sender;
    snapshot[@"aul_threadIdentifier"] = [NSNumber numberWithUnsignedLongLong:entry.threadIdentifier];
}

- (void)captureOSLogEntryWithPayload:(nullable OSLogEntry<OSLogEntryWithPayload> *)entry
                        intoSnapshot:(nonnull NSMutableDictionary<NSString *, id> *)snapshot {

    if (nil == entry) {
        return;
    }
    
    snapshot[@"aul_category"] = entry.category;
    snapshot[@"aul_subsystem"] = entry.subsystem;
}

@end

#endif //TARGET_OS_OSX
