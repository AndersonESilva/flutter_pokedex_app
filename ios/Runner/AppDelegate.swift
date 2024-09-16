import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    
    private let CHANNEL = "com.example/battery_channel"
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        guard let controller = window?.rootViewController as? FlutterViewController else {
            fatalError("rootViewController is not FlutterViewController")
        }
        
        let methodChannel = FlutterMethodChannel(name: CHANNEL, binaryMessenger: controller.binaryMessenger)
        
        methodChannel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if call.method == "getBatteryLevel" {
                self.getBatteryLevel(result: result)
            } else {
                result(FlutterMethodNotImplemented)
            }
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func getBatteryLevel(result: @escaping FlutterResult) {
        UIDevice.current.isBatteryMonitoringEnabled = true
        let batteryLevel = UIDevice.current.batteryLevel
        print("Battery Level: \(batteryLevel)") 
        if batteryLevel < 0 {
            result(FlutterError(code: "UNAVAILABLE", message: "Battery level not available.", details: nil))
        } else {
            result(Int(batteryLevel * 100))
        }
    }
}
