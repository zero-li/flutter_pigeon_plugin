package com.zero.flutter_pigeon_plugin

import android.content.Context
import android.widget.Toast
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin

/** FlutterPigeonPlugin */
class FlutterPigeonPlugin: FlutterPlugin, FlutterCallNativeApi {

  lateinit var nativeApi : NativeCallFlutterApi
  lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext

    // setup
    FlutterCallNativeApi.setUp(flutterPluginBinding.binaryMessenger, this)

    nativeApi = NativeCallFlutterApi(flutterPluginBinding.binaryMessenger)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

    FlutterCallNativeApi.setUp(binding.binaryMessenger, null)
  }

  // flutter call native
  override fun search(arg: SearchRequest): SearchReply {
    val reply = SearchReply(arg.query + "-nativeResult")


    // ------ native call flutter
    nativeApi.query(arg){
      Toast.makeText(context, reply.result, Toast.LENGTH_SHORT).show()
    }
    // -------

    // native reply flutter
    return reply
  }




}
