// Autogenerated from Pigeon (v0.1.17), do not edit directly.
// See also: https://pub.dev/packages/pigeon
#import "Pigeon.h"
#import <Flutter/Flutter.h>

#if !__has_feature(objc_arc)
#error File requires ARC to be enabled.
#endif

static NSDictionary* wrapResult(NSDictionary *result, FlutterError *error) {
  NSDictionary *errorDict = (NSDictionary *)[NSNull null];
  if (error) {
    errorDict = [NSDictionary dictionaryWithObjectsAndKeys:
        (error.code ? error.code : [NSNull null]), @"code",
        (error.message ? error.message : [NSNull null]), @"message",
        (error.details ? error.details : [NSNull null]), @"details",
        nil];
  }
  return [NSDictionary dictionaryWithObjectsAndKeys:
      (result ? result : [NSNull null]), @"result",
      errorDict, @"error",
      nil];
}

@interface FLTSearchReply ()
+(FLTSearchReply*)fromMap:(NSDictionary*)dict;
-(NSDictionary*)toMap;
@end
@interface FLTSearchRequest ()
+(FLTSearchRequest*)fromMap:(NSDictionary*)dict;
-(NSDictionary*)toMap;
@end

@implementation FLTSearchReply
+(FLTSearchReply*)fromMap:(NSDictionary*)dict {
  FLTSearchReply* result = [[FLTSearchReply alloc] init];
  result.result = dict[@"result"];
  if ((NSNull *)result.result == [NSNull null]) {
    result.result = nil;
  }
  return result;
}
-(NSDictionary*)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.result ? self.result : [NSNull null]), @"result", nil];
}
@end

@implementation FLTSearchRequest
+(FLTSearchRequest*)fromMap:(NSDictionary*)dict {
  FLTSearchRequest* result = [[FLTSearchRequest alloc] init];
  result.query = dict[@"query"];
  if ((NSNull *)result.query == [NSNull null]) {
    result.query = nil;
  }
  return result;
}
-(NSDictionary*)toMap {
  return [NSDictionary dictionaryWithObjectsAndKeys:(self.query ? self.query : [NSNull null]), @"query", nil];
}
@end

void FLTFlutterCallNativeApiSetup(id<FlutterBinaryMessenger> binaryMessenger, id<FLTFlutterCallNativeApi> api) {
  {
    FlutterBasicMessageChannel *channel =
      [FlutterBasicMessageChannel
        messageChannelWithName:@"dev.flutter.pigeon.FlutterCallNativeApi.search"
        binaryMessenger:binaryMessenger];
    if (api) {
      [channel setMessageHandler:^(id _Nullable message, FlutterReply callback) {
        FlutterError *error;
        FLTSearchRequest *input = [FLTSearchRequest fromMap:message];
        FLTSearchReply *output = [api search:input error:&error];
        callback(wrapResult([output toMap], error));
      }];
    }
    else {
      [channel setMessageHandler:nil];
    }
  }
}
@interface FLTNativeCallFlutterApi ()
@property (nonatomic, strong) NSObject<FlutterBinaryMessenger>* binaryMessenger;
@end

@implementation FLTNativeCallFlutterApi
- (instancetype)initWithBinaryMessenger:(NSObject<FlutterBinaryMessenger>*)binaryMessenger {
  self = [super init];
  if (self) {
    self.binaryMessenger = binaryMessenger;
  }
  return self;
}

- (void)query:(FLTSearchRequest*)input completion:(void(^)(FLTSearchReply*, NSError* _Nullable))completion {
  FlutterBasicMessageChannel *channel =
    [FlutterBasicMessageChannel
      messageChannelWithName:@"dev.flutter.pigeon.NativeCallFlutterApi.query"
      binaryMessenger:self.binaryMessenger];
  NSDictionary* inputMap = [input toMap];
  [channel sendMessage:inputMap reply:^(id reply) {
    NSDictionary* outputMap = reply;
    FLTSearchReply * output = [FLTSearchReply fromMap:outputMap];
    completion(output, nil);
  }];
}
@end
