//  GuidanceViewControllers.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class GuidanceViewControllers: UIViewController {
    
    var swipe: SwipeClass?, guide: GuideModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guide = GuideModel(); guide.updateUI(view: self.view); swipeActions()
        
       
    }
    
    private func swipeActions() {
        swipe = SwipeClass(viewController: self,
                           leftAction: { [weak self] in
            guard let self = self else {return}
            let view = FirstViewController()
            self.navigationController?.pushViewController(view, animated: true)
        },
                           rightAction: { [weak self] in
            guard let self = self else {return}
            self.dismiss(animated: true, completion: nil)
        })
    }
}





