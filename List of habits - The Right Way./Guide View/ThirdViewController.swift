//  ThirdViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 7.06.24.

import UIKit

class ThirdViewController: UIViewController {
    
    var swipe: SwipeClass?, thrid: ThirdModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thrid = ThirdModel(); thrid.updateUI(view: self.view)
        
        swipeActions()
    }
    
    private func swipeActions() {
        swipe = SwipeClass(viewController: self,
                           leftAction: { [weak self] in
            guard let self = self else {return }
            self.dismiss(animated: false, completion: nil)
        },
                           rightAction:{ [weak self] in
            guard let self = self else {return }
            self.navigationController?.popViewController(animated: true)
        })
    }
}

