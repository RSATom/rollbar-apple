//  Copyright (c) 2018 Rollbar Inc. All rights reserved.

//#import <Foundation/Foundation.h>
@import Foundation;

/// SDK-wide logging function.
/// Use it for all the SDK development/debugging needs.
/// @param format logged message format
void RollbarSdkLog(NSString *format, ...);