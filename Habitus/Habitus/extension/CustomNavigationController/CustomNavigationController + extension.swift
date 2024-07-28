import UIKit


extension CustomNavigationController {
    
    func showInitialViewController() {
        let listVC = ListVC()
        self.setViewControllers([listVC], animated: false)
    }
}
