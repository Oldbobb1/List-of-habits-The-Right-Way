import UIKit
import ElementBuilder


extension SubscribeVC {

    func swipeAct() {
        swipe = SwipeClass(viewController: self,
                           leftAction: {},
                           rightAction: {[weak self] in
            guard let self = self else {return}
            dismiss(animated: true, completion: nil)})
    }
    
}
