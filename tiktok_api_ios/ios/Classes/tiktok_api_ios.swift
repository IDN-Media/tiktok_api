import Flutter
import UIKit

public class TiktokApiIosPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {

    let controller = UIApplication.shared.delegate!.window!!.rootViewController! as! FlutterViewController
    let tiktokApi = TiktokSDKApiImplementation(controller:  controller)
    TiktokSDKApiSetup.setUp(binaryMessenger: controller.binaryMessenger, api: tiktokApi)


  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
