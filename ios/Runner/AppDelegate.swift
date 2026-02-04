import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        setMethodChannel()
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        if url.host == "startParking" {
            FlutterMethodChannelBridge.shared.invoke(
                method: "startParking"
            )
            return true
        }
        
        return false
    }
}

extension AppDelegate {
    fileprivate func setMethodChannel() {
        guard let controller = window?.rootViewController as? FlutterViewController
        else { fatalError("RootViewController is not FlutterViewController") }
        
        let channel = FlutterMethodChannel(
            name: "siri_channel",
            binaryMessenger: controller.binaryMessenger
        )
        
        channel.setMethodCallHandler { call, result in
            switch call.method {
                
            case "get_parking_start_time":
                if let date = ParkingService().get() {
                    result(date.timeIntervalSince1970)
                } else {
                    result(nil)
                }
                
            case "set_parking_start_time":
                ParkingRepository().start()
                
                if let date = ParkingService().get() {
                    result(date.timeIntervalSince1970)
                } else {
                    result(nil)
                }
                
            case "end_parking_start_time":
                ParkingRepository().stop()
                result(nil)
                
            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }
}
