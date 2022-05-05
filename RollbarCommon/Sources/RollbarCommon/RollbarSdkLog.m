#import "RollbarSdkLog.h"

void RollbarSdkLog(NSString *format, ...) {
#if defined(DEBUG) && 0
    va_list args;
    va_start(args, format);
    NSLog(@"[Rollbar] %@", [[NSString alloc] initWithFormat:format arguments:args]);
    va_end(args);
#endif
}
