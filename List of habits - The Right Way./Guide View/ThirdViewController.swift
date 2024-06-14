//  ThirdViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 7.06.24.

import UIKit

class ThirdViewController: UIViewController{
    
    let label = Label.label(text: "Обзор", fontSize: 20)
    let label1 = Label.label(text: "При помощи графиков вы легко можете посмотреть полную историю ваших привычек и то, как они закрепились со временем.", fontSize: 15)
    
//    let imageView = Image.createImage("")
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeBack))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeClose = UISwipeGestureRecognizer(target: self, action: #selector(closeView))
        swipeClose.direction = .left
        self.view.addGestureRecognizer(swipeClose)
        
    }
    
    @objc func swipeBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func closeView() {
        self.dismiss(animated: false, completion: nil)
    }
}


