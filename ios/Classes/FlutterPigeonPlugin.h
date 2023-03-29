#import <Flutter/Flutter.h>

#import "Pigeon.h"

@interface FlutterPigeonPlugin : NSObject<FlutterPlugin>

@end


@interface FlutterCallNativeApi : NSObject<FLTFlutterCallNativeApi>

- (void)setupFLTNativeCallFlutterApiWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger;

@end


