import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    lazy var rootViewController = ViewController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.makeKeyAndVisible()
        window!.windowScene = windowScene
        window!.rootViewController = rootViewController
    }


    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        guard let url = URLContexts.first?.url else {
              return
          }

        let parameters = rootViewController.appRemote.authorizationParameters(from: url);

          if let access_token = parameters?[SPTAppRemoteAccessTokenKey] {
              rootViewController.appRemote.connectionParameters.accessToken = access_token
              rootViewController.accessToken = access_token
          } else if let error_description = parameters?[SPTAppRemoteErrorDescriptionKey] {
              // Show the error
          }
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        if let _ = rootViewController.appRemote.connectionParameters.accessToken {
           rootViewController.appRemote.connect()
         }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        if rootViewController.appRemote.isConnected {
            rootViewController.appRemote.disconnect()
        }
    }
}
