import UIKit
import CarPlay

class CarPlaySceneDelegate: UIResponder, CPTemplateApplicationSceneDelegate {

    var carPlayWindow: CPWindow?

    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene,
                                  didConnectCarInterfaceController interfaceController: CPInterfaceController,
                                  to window: CPWindow) {

        print("CARPLAY: scene")
        
        self.carPlayWindow = window

        let storyboard = UIStoryboard(name: "CarPlay", bundle: nil)
        let carPlayVC = storyboard.instantiateViewController(withIdentifier: "CarPlayVC")
        window.rootViewController = carPlayVC
        window.makeKeyAndVisible()
    }

    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene,
                                  didDisconnectCarInterfaceController interfaceController: CPInterfaceController,
                                  from window: CPWindow) {
        self.carPlayWindow = nil
    }
}
