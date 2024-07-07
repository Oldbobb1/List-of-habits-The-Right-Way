//
//  SceneDelegate.swift
//  Habitus
//
//  Created by Bobbi R. on 7.07.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene )
        
        let tabBar = AnimatedTabBarController()
        tabBar.tabBar.barStyle = .default
        tabBar.delegate = self
        
        let listVC = ListVC()
        listVC.view.backgroundColor = UIColor.systemBackground
        let firstFolder = UIImage(systemName: "list.bullet.circle")?.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
        listVC.tabBarItem = UITabBarItem(title: "list", image: firstFolder, tag: 1 )
        
        let notesVC = NotesVC()
        notesVC.view.backgroundColor = UIColor.systemBackground
        let secondFolder = UIImage(systemName: "pencil.circle")?.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
        notesVC.tabBarItem = UITabBarItem(title: "notes", image: secondFolder, tag: 2 )

        let settingVC =  SettingVC()
        settingVC.view.backgroundColor = UIColor.systemBackground
        let thirdFolder = UIImage(systemName: "gear")?.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
        settingVC.tabBarItem = UITabBarItem(title: "setting", image: thirdFolder, tag: 3 )

        tabBar.viewControllers = [listVC, notesVC, settingVC]
        
        window.rootViewController = tabBar
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



extension SceneDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
        guard let index = tabBarController.viewControllers?.firstIndex(of: viewController) else { return }
        
        let backgroundColor = viewController.view.backgroundColor
        
        switch index {
        case 0:
            tabBarController.tabBar.barTintColor = backgroundColor
            tabBarController.tabBar.tintColor = UIColor.systemOrange
        case 1:
            tabBarController.tabBar.barTintColor = backgroundColor
            tabBarController.tabBar.tintColor = UIColor.systemGreen
        case 2:
            tabBarController.tabBar.barTintColor = backgroundColor
            tabBarController.tabBar.tintColor = UIColor.systemYellow
        default:
            break
        }
    }
}


class AnimatedTabBarController: UITabBarController {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        guard let index = tabBar.items?.firstIndex(of: item), let tabBarItemView = tabBar.subviews[index + 1] as? UIControl else { return }
        
        animateTabBarItem(tabBarItemView)
    }
    
//    private func animateTabBarItem(_ view: UIControl) {    // - оборот 360
//        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
//        animation.fromValue = 0
//        animation.toValue = CGFloat.pi * 2
//        animation.duration = 0.5
//        animation.repeatCount = 1
//        view.layer.add(animation, forKey: "rotate")
//    }
    
        private func animateTabBarItem(_ view: UIControl) {  // - пульс
            let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
            pulseAnimation.duration = 0.1
            pulseAnimation.fromValue = 1.0
            pulseAnimation.toValue = 1.1
            pulseAnimation.autoreverses = true
            pulseAnimation.repeatCount = 1
            view.layer.add(pulseAnimation, forKey: "pulse")
        }
    
}
