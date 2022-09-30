import UIKit
import Flutter
import GoogleMaps
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyC-xlLoinQN8rKkE8cqVnQmy9o-jjTF1L0")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
