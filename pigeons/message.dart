///
/// @Desc: 
/// @Author: zhhli
/// @Date: 2021-01-08
///
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: './lib/message.dart',
  javaOut: 'android/src/main/kotlin/com/zero/flutter_pigeon_plugin/Pigeon.java',
  javaOptions: JavaOptions(
    className: 'Pigeon',
    package: 'com.zero.flutter_pigeon_plugin',
  ),
  objcHeaderOut: 'ios/Runner/Pigeon.h',
  objcSourceOut: 'ios/Runner/Pigeon.m',
  objcOptions: ObjcOptions(
    prefix: 'FLT',
  ),
))

// 输出配置
// flutter pub run pigeon --input pigeons/message.dart
// void configurePigeon(PigeonOptions opts) {
//   String dartOut = './lib/message.dart';
//   String javaOut = 'android/src/main/kotlin/com/zero/flutter_pigeon_plugin/Pigeon.java';
//   String javaOptions_package = "com.zero.flutter_pigeon_plugin";
//   String objcHeaderOut = 'ios/Runner/Pigeon.h';
//   String objcSourceOut = 'ios/Runner/Pigeon.m';
//   String objcOptions_prefix = 'FLT';
//
//
// }


class SearchRequest {
  String query;
}

class SearchReply {
  String result;
}

/// flutter call native
@HostApi()
abstract class FlutterCallNativeApi {
  SearchReply search(SearchRequest request);
}

/// native call flutter
@FlutterApi()
abstract class NativeCallFlutterApi{
  SearchReply query(SearchRequest request);
}
