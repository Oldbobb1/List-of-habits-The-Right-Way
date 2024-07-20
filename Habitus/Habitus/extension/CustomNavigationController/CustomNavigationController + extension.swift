import UIKit


extension CustomNavigationController {
    
    func showInitialViewController() {
        let listVC = ListVC()
        self.setViewControllers([listVC], animated: false)
    }
    
    func animateButton(_ button: UIButton) {
        UIView.animate(withDuration: 0.1,
                       animations: {
            button.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        },
                       completion: { _ in
            UIView.animate(withDuration: 0.1) {
                button.transform = CGAffineTransform(rotationAngle: 2 * CGFloat.pi)
            }
        })
    }
    
}
