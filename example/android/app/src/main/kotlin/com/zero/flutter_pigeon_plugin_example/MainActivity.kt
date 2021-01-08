package com.zero.flutter_pigeon_plugin_example

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        // notice : here will auto call
        // flutterEngine.getPlugins().add(new com.zero.flutter_pigeon_plugin.FlutterPigeonPlugin());
        super.configureFlutterEngine(flutterEngine)
    }
}
