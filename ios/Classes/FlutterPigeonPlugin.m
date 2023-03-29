#import "FlutterPigeonPlugin.h"
#if __has_include(<flutter_pigeon_plugin/flutter_pigeon_plugin-Swift.h>)
#import <flutter_pigeon_plugin/flutter_pigeon_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_pigeon_plugin-Swift.h"
#endif

#import <UIKit/UIKit.h>

@implementation FlutterPigeonPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterPigeonPlugin registerWithRegistrar:registrar];



  FlutterCallNativeApi *api = [[FlutterCallNativeApi alloc] init];

  [api setupFLTNativeCallFlutterApiWithBinaryMessenger:[registrar messenger]];

  FLTFlutterCallNativeApiSetup([registrar messenger], api);

}

- (BOOL)application:(UIApplication*)application
    didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
  NSLog(@"didFinishLaunchingWithOptions");
  return YES;
}

@end



@interface FlutterCallNativeApi ()

@property(nonatomic, strong) FLTNativeCallFlutterApi *nativeCallFlutterApi;

@end


@implementation  FlutterCallNativeApi

- (nullable FLTSearchReply *)searchRequest:(FLTSearchRequest *)request error:(FlutterError *_Nullable *_Nonnull)error
{
        NSString *result = @"flutter call iOS ";
        FLTSearchReply *reply = [FLTSearchReply makeWithResult:result];

        //(void)queryRequest:(FLTSearchRequest *)request completion:(void (^)(FLTSearchReply *_Nullable, FlutterError *_Nullable))completion;
        [self.nativeCallFlutterApi  queryRequest:[FLTSearchRequest makeWithQuery:@"iOS call flutter"] completion:^(FLTSearchReply *_Nullable reply, FlutterError * _Nullable error) {
                /*NSString *message = @"Some message...";

                UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                               message:message
                                                                        preferredStyle:UIAlertControllerStyleAlert];

                [self presentViewController:alert animated:YES completion:nil];

                int duration = 1; // duration in seconds

                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, duration * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
                    [alert dismissViewControllerAnimated:YES completion:nil];
                });*/

                NSLog(@"queryRequest-> queryRequest : %@", reply.result);

        }];

        return reply;


}

- (void)setupFLTNativeCallFlutterApiWithBinaryMessenger:(id<FlutterBinaryMessenger>)binaryMessenger
{
        self.nativeCallFlutterApi = [[FLTNativeCallFlutterApi alloc] initWithBinaryMessenger:binaryMessenger];
}

@end
