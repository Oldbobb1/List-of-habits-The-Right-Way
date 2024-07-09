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
            tabBarController.tabBar.tintColor = UIColor.black
        case 1:
            tabBarController.tabBar.barTintColor = backgroundColor
            tabBarController.tabBar.tintColor = UIColor.black
        case 2:
            tabBarController.tabBar.barTintColor = backgroundColor
            tabBarController.tabBar.tintColor = UIColor.black
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
    
    //    private func animateTabBarItem(_ view: UIControl) {  // - пульс
    //        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
    //        pulseAnimation.duration = 0.1
    //        pulseAnimation.fromValue = 1.0
    //        pulseAnimation.toValue = 1.1
    //        pulseAnimation.autoreverses = true
    //        pulseAnimation.repeatCount = 1
    //        view.layer.add(pulseAnimation, forKey: "pulse")
    //    }
    
    private func animateTabBarItem(_ view: UIControl) {
        for subview in view.subviews {
            if let label = subview as? UILabel {
                label.layer.removeAllAnimations()
            } else {
                let pulseAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
                pulseAnimation.fromValue = 0
                pulseAnimation.toValue = 1 * CGFloat.pi
                pulseAnimation.repeatCount = 1
                subview.layer.add(pulseAnimation, forKey: "rotate")
            }
        }
    }
    
}
