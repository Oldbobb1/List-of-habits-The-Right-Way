//  FirstViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 7.06.24.

import UIKit
import SnapKit

class FirstViewController: UIViewController{
    
    let label = Label.label(text: "Новая привычка", fontSize: 20)
    let label1 = Label.label(text: "Добавьте привычку, выберите цвет и укажите, с помощью гибких настроек, когда хотите получать уведомления. Здесь уведомления отсутсвуют в привычном виде, они похожи на будильник, чтобы точно не пропустить свою привычку.", fontSize: 15)
    let imageView = Image.createImage("guidePrew3")
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(); swipe()
        
    }
    
    private func updateUI() {
        
        view.backgroundColor = UIColor.systemBackground
        
        view.addSubview(label)
        view.addSubview(label1)
        self.view.addSubview(imageView)
        
        imageView.layer.cornerRadius = 30
        
        //        Layout.applyView(imageView, view: view, additionalConstraints: { (make) in //guidePrew2
        //            make.centerX.equalToSuperview()
        //            make.centerY.equalToSuperview().offset(-50)
        //            make.width.equalTo(370)
        //            make.height.equalTo(450)
        //                })
        Layout.applyView(imageView, view: view, additionalConstraints: { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.equalTo(370)
            make.height.equalTo(470)
        })
        
        Layout.applyView(label, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: -90 )
        Layout.applyView(label1, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: 10 )
    }
    
    private func swipe() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeBack))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    
    @objc func swipeLeft() {
        let newViewController = SecondViewController()
        self.navigationController?.pushViewController(newViewController, animated: true)
    }
    
    @objc func swipeBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

