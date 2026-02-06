import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        
        DispatchQueue.main.async { [weak self] in
            self?.setMethodChannel()
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

extension AppDelegate {
    fileprivate func setMethodChannel() {
        guard let controller = window?.rootViewController as? FlutterViewController
        else { return }
        
        let channel = FlutterMethodChannel(
            name: "siri_channel",
            binaryMessenger: controller.binaryMessenger
        )
        
        channel.setMethodCallHandler { call, result in
            switch call.method {
                
            case "get_parking_start_time":
                if let date = GetParkingUseCase().exec() {
                    result(date.timeIntervalSince1970)
                } else {
                    result(nil)
                }
                
            case "set_parking_start_time":
                Task {
                    await StartParkingUseCase().exec()
                    
                    if let date = ParkingService().get() {
                        result(date.timeIntervalSince1970)
                    } else {
                        result(nil)
                    }
                }
                
            case "end_parking_start_time":
                StopParkingUseCase().exec()
                result(nil)
                
            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }
}
