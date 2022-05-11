import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_pigeon_plugin/message.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class NativeCallFlutterApiImpl extends NativeCallFlutterApi{
  @override
  SearchReply query(SearchRequest arg) {
    SearchReply reply = SearchReply(result: arg.query + "-flutterResult");
    return reply;
  }

}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();

    NativeCallFlutterApi.setup(NativeCallFlutterApiImpl());
  }

  Future<void> getNativeResult() async{
    FlutterCallNativeApi api = FlutterCallNativeApi();
    SearchRequest request = SearchRequest()..query = "Zero";
    SearchReply reply = await api.search(request);
    setState(() {
      _platformVersion = reply.result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(

          child: Column(

            children: [
              Text('Running on: $_platformVersion\n'),
              MaterialButton(
                  height: 40,
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 5,
                  splashColor: Colors.teal,
                  padding: EdgeInsets.all(8),
                  child: Text("点击调用 native"),
                  onPressed: ()=>{
                    getNativeResult()
                  })
            ],
          ),
        ),
      ),
    );
  }
}
