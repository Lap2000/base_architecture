import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    let controller = window.rootViewController as! FlutterViewController

    let flavorChannel = FlutterMethodChannel(
        name: "test.flutter.native",
        binaryMessenger: controller.binaryMessenger)

    flavorChannel.setMethodCallHandler({(call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        switch call.method {
        case "getFlavor":
            self.getFlavor(result: result)
        case "getBattery":
            self.receiveBatteryLevel(result: result)
        default:
            result(FlutterMethodNotImplemented)
            return
        }
    })

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func getFlavor(result: FlutterResult) {
        let flavor = Bundle.main.infoDictionary?["App - Flavor"]
        result(flavor)
        }
    
    private func receiveBatteryLevel(result: FlutterResult) {
            debugPrint("From ios native: getBatteryLevel")
            let device = UIDevice.current
            print(device.batteryState, device.batteryLevel)
            debugPrint(device.batteryState)
            debugPrint(device.batteryLevel)
            device.isBatteryMonitoringEnabled = true
        if device.batteryState == UIDevice.BatteryState.unknown {
                result(FlutterError(code: "UNAVAILABLE",
                                    message: "Battery info unavailable",
                                    details: nil))
            } else {
                result(Int(device.batteryLevel * 100))
            }
        }
}
