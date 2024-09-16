package com.example.flutter_pokedex_app

import android.content.Context
import android.os.BatteryManager
import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity(){
    private val CHANNEL = "com.example/battery_channel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                if (call.method == "getBatteryLevel") {
                    val batteryLevel = getBatteryLevel()
                    result.success(batteryLevel)
                } else {
                    result.notImplemented()
                }
            }
    }

    private fun getBatteryLevel(): Int? {
        val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = android.content.IntentFilter(android.content.Intent.ACTION_BATTERY_CHANGED).let {
                registerReceiver(null, it)
            }
            intent?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1)?.let { level ->
                val scale = intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
                (level / scale.toFloat() * 100).toInt()
            }
        }
    }
}
