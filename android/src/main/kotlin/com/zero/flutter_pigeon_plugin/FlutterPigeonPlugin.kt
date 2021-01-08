package com.zero.flutter_pigeon_plugin

import android.content.Context
import android.widget.Toast
import androidx.annotation.NonNull
import com.zero.flutter_pigeon_plugin.Pigeon.*
import io.flutter.embedding.engine.plugins.FlutterPlugin

/** FlutterPigeonPlugin */
class FlutterPigeonPlugin: FlutterPlugin, FlutterCallNativeApi {

  lateinit var nativeApi : NativeCallFlutterApi
  lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.applicationContext

    // setup
    FlutterCallNativeApi.setup(flutterPluginBinding.binaryMessenger, this)

    nativeApi = NativeCallFlutterApi(flutterPluginBinding.binaryMessenger)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

    FlutterCallNativeApi.setup(binding.binaryMessenger, null)
  }

  // flutter call native
  override fun search(arg: SearchRequest?): SearchReply {
    val reply = SearchReply()
    reply.result = arg!!.query + "-nativeResult"

    // ------ native call flutter
    nativeApi.query(arg, object : NativeCallFlutterApi.Reply<SearchReply>{
      override fun reply(reply: SearchReply?) {
        // flutter reply
        Toast.makeText(context, reply!!.result, Toast.LENGTH_SHORT).show()
      }
    })
    // -------

    // native reply flutter
    return reply
  }


}
