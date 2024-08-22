package com.example.test_sample

import android.content.Context
import android.os.BatteryManager
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val channel = "test.flutter.native"
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            channel
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "getFlavor" -> {
                    Log.d("From native android ", "method called: ${call.method}")
                    result.success(BuildConfig.FLAVOR)
                }
                "getBattery" -> {
                    Log.d("From native android ", "method called: ${call.method}")
                    val batteryLevel = getBatteryLevel()

                    if (batteryLevel != -1) {
                        result.success(batteryLevel)
                    } else {
                        result.error("UNAVAILABLE", "Battery level not available.(${call.method})", null)
                    }
                }

                else -> {
                    Log.e("From native android ", "method called: ${call.method} not existed")
                    result.notImplemented()
                }
            }
        }
    }

    private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
        batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)

        return batteryLevel
    }
}