//
//  FlutterChannelBridge.swift
//  Runner
//
//  Created by Aziz Nurfalah on 30/01/26.
//

class FlutterMethodChannelBridge {
    static let shared = FlutterMethodChannelBridge()
    var channel: FlutterMethodChannel?

    func invoke(method: String) {
        channel?.invokeMethod(method, arguments: nil)
    }
}
