//  ThirdViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 7.06.24.

import UIKit

class ThirdViewController: UIViewController{
    
    let label = Label.label(text: "Обзор", fontSize: 20)
    let label1 = Label.label(text: "При помощи графиков вы легко можете посмотреть полную историю ваших привычек и то, как они закрепились со временем.", fontSize: 15)
    //    let imageView = Image.createImage("")
    var swipe: SwipeClass?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(); swipeActions()
    }
    
    private func updateUI() {
        
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(label)
        view.addSubview(label1)
        //        self.view.addSubview(imageView)
        
        //        Layout.applyView(imageView, view: view, additionalConstraints: { (make) in
        //                                make.centerX.equalToSuperview()
        //                                make.centerY.equalToSuperview()
        //                                make.width.equalTo(300)
        //                                make.height.equalTo(300)
        //                            })
        
        //        imageView.snp.makeConstraints { (make) in
        //                    make.centerX.equalToSuperview()
        //                    make.centerY.equalToSuperview()
        //                    make.width.equalTo(300)
        //                    make.height.equalTo(300)
        //                }
        
        Layout.applyView(label, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: -80 )
        Layout.applyView(label1, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: -20 )
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

