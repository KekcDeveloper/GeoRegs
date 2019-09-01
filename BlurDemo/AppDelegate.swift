import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let blurController = storyboard.instantiateViewController(withIdentifier: "BlurController")
        window?.rootViewController?.present(blurController, animated: true)
    }

}
