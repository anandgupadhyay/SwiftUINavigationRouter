import SwiftUI
import UIKit

// no changes in your AppDelegate class
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print(">> your code here !!")
        return true
    }
}

@main
struct Testing_SwiftUI2App: App {

    // inject into SwiftUI life-cycle via adaptor !!!
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

//Or  another solutoin is to have a separate AppDelegate class
class AppDelegate: NSObject, UIApplicationDelegate {

  var didFinishLaunching: ((AppDelegate) -> Void)?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions
      launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
  ) -> Bool {
    didFinishLaunching?(self)
    return true
  }
}

@main
struct MyApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  @ObservedObject private var applicationModel = ApplicationModel()

  // `init` gets called BEFORE `didFinishLaunchingWithOptions`
  init() {

    // Subscribe to get a `didFinishLaunching` call
    appDelegate.didFinishLaunching = { [weak applicationObject] appDelegate in

      // Setup any application code...
      applicationModel?.setup()
    }
  }

  var body: some Scene {
    return WindowGroup {
      if applicationObject.isUserLoggedIn {
        LoggedInView()
      } else {
        LoggedOutView()
      }
    }
  }
}
