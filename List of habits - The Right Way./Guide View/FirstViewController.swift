//  FirstViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 7.06.24.

import UIKit

class FirstViewController: UIViewController {
    
    var swipe: SwipeClass?, first: FirstModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        first = FirstModel(); first.updateUI(view: self.view)
        
        swipeActions()
    }
    
    private func swipeActions() {
        swipe = SwipeClass(viewController: self,
                           leftAction: {[weak self] in
            guard let self = self else {return}
            let view = SecondViewController()
            self.navigationController?.pushViewController(view, animated: true)
        },
                           rightAction: {[weak self] in
            guard let self = self else {return}
            self.navigationController?.popViewController(animated: true)
        })
    }
}

