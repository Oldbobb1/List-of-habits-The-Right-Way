//  GuidanceViewControllers.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class GuidanceViewControllers: UIViewController {
    
    let label = Label.label(text: "Habits", fontSize: 20)
    let label1 = Label.label(text: "Habits поможет вам завести и поддерживать полезные привычки, позволяя улучшить свою жизнь.", fontSize: 15)
    let imageView = Image.createImage("guidePrew")
    var swipe: SwipeClass?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(); swipeActions()
        
    }
    
    private func updateUI() {
        
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(label)
        view.addSubview(label1)
        self.view.addSubview(imageView)
        
        imageView.layer.cornerRadius = 150
        
        Layout.applyView(imageView, view: view, additionalConstraints: { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(300)
        })
        
        Layout.applyView(label, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: -80 )
        Layout.applyView(label1, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: -20 )
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




