import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    let app = super.application(application, didFinishLaunchingWithOptions: launchOptions)
    let schemeName = Bundle.main.infoDictionary!["APP_SETTING_CUSTOM"] as! String
    print("SCHEME: " + schemeName)
    return app
  }
}
