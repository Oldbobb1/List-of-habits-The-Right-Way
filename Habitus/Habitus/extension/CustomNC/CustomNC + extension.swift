import UIKit


extension CustomNavigationController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

            customButtomMenu.openHabitVC.isHidden = !(self.viewControllers.last is ListVC)
    }
    
}
