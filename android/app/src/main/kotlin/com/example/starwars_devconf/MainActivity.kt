package com.example.starwars_devconf

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

    /// Configure flutter engine
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            // This method is invoked on the main thread.
            call, result ->
            if (call.method == "getBatteryLevel") {
              val batteryLevel = getBatteryLevel()
              result.success(batteryLevel)
            } else {
              result.notImplemented()
            }
        }
      }

      private fun getBatteryLevel(): Int {
        val batteryLevel: Int
        if (VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP) {
          val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
          batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
          val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
          batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
        }
    
        return batteryLevel
      }
}
