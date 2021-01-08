///
/// @Desc: 
/// @Author: zhhli
/// @Date: 2021-01-08
///
import 'package:pigeon/pigeon.dart';

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

// 输出配置
// flutter pub run pigeon --input pigeons/message.dart
void configurePigeon(PigeonOptions opts) {
  opts.dartOut = './lib/message.dart';
  opts.javaOut = 'android/src/main/kotlin/com/zero/flutter_pigeon_plugin/Pigeon.java';
  opts.javaOptions.package = "com.zero.flutter_pigeon_plugin";
  opts.objcHeaderOut = 'ios/Runner/Pigeon.h';
  opts.objcSourceOut = 'ios/Runner/Pigeon.m';
  opts.objcOptions.prefix = 'FLT';
}