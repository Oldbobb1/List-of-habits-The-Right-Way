//  SceneDelegate.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene )
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = .red
        tabBarController.tabBar.tintColor.withAlphaComponent(1)
        tabBarController.tabBar.barStyle = .default
    
   
        let firstView = ListViewController()
        firstView.view.backgroundColor = UIColor.systemBackground
        let firstFolder = UIImage(systemName: "list.bullet.circle")
        firstView.tabBarItem = UITabBarItem(title: "list", image: firstFolder, tag: 1 )
        
        let secondView = NotesViewController()
        secondView.view.backgroundColor = UIColor.systemBackground
        let secondFolder = UIImage(systemName: "pencil.circle")
        secondView.tabBarItem = UITabBarItem(title: "notes", image: secondFolder, tag: 2 )
        
    
        let thirdView =  SettingViewController()
        thirdView.view.backgroundColor = UIColor.systemBackground
        let thirdFolder = UIImage(systemName: "gear")
        thirdView.tabBarItem = UITabBarItem(title: "setting", image: thirdFolder, tag: 3 )
        
        tabBarController.viewControllers = [firstView, secondView, thirdView]
        
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        self.window = window
    
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

