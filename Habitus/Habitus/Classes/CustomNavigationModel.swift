import UIKit


class CustomNavigationModel {
    // Открытие нового ViewController
    func openViewController(ofType viewControllerType: UIViewController.Type, in navigationController: UINavigationController) {
        let viewController = viewControllerType.init()
        navigationController.setViewControllers([viewController], animated: false)
    }
}
