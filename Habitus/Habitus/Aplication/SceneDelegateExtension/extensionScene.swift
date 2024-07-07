//  extensionScene.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import UIKit

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
