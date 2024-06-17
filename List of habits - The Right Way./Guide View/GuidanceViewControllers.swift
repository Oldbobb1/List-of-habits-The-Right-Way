//  GuidanceViewControllers.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class GuidanceViewControllers: UIViewController {
    
    let label = Label.label(text: "Habits", fontSize: 20)
    let label1 = Label.label(text: "Habits поможет вам завести и поддерживать полезные привычки, позволяя улучшить свою жизнь.", fontSize: 15)
    let imageView = Image.createImage("guidePrew")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(); swipe()
        
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
    
  private  func swipe() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeClose = UISwipeGestureRecognizer(target: self, action: #selector(closeView))
        swipeClose.direction = .right
        self.view.addGestureRecognizer(swipeClose)
    }
    
    @objc func swipeLeft() {
        let newViewController = FirstViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc func closeView() {
        self.dismiss(animated: true, completion: nil)
    }
}





