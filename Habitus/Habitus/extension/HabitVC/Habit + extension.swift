import UIKit
import ElementBuilder


extension HabitVC {
    
    func swipeActions() {
        swipe = SwipeClass(viewController: self,
                           leftAction:{},
                           rightAction: {[weak self] in
            guard let self = self else {return}
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    func themeUpdate() {
        
        if traitCollection.userInterfaceStyle == .dark {
            //            view.backgroundColor = .red
            // Настройка элементов для темной темы
            habitView.buttonCloseUIView.layer.shadowColor = UIColor.white.cgColor
            //            habitView.buttonCloseUIView.backgroundColor = .lightGray
            habitView.buttonSaveAndSendInTable.layer.shadowColor = UIColor.white.cgColor
            habitView.titleLabel.layer.shadowColor = UIColor.white.cgColor
            // ...
        } else {
            view.backgroundColor = .systemBackground
            // Настройка элементов для светлой темы
            habitView.buttonCloseUIView.layer.shadowColor = UIColor.black.cgColor
            habitView.buttonSaveAndSendInTable.layer.shadowColor = UIColor.black.cgColor
            habitView.titleLabel.layer.shadowColor = UIColor.black.cgColor
            // ...
        }
    }
    
}
