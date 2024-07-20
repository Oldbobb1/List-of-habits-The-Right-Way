import UIKit


extension ListVC {
    
    func toggleMessageLabelVisibility() {
        listView.messageLabel.isHidden = !listModel.habits.isEmpty
    }
    
    func animateButtonScale(for button: UIButton, scaleFactor: CGFloat) {
        UIView.animate(withDuration: 0.1, animations: {
            button.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        }) { _ in
            UIView.animate(withDuration: 0.1) {
                button.transform = .identity
            }
        }
    }
    
}
