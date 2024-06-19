//  FirstViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 7.06.24.

import UIKit
import SnapKit

class FirstViewController: UIViewController{
    
    let label = Label.label(text: "Новая привычка", fontSize: 20)
    let label1 = Label.label(text: "Добавьте привычку, выберите цвет и укажите, с помощью гибких настроек, когда хотите получать уведомления. Здесь уведомления отсутсвуют в привычном виде, они похожи на будильник, чтобы точно не пропустить свою привычку.", fontSize: 15)
    let imageView = Image.createImage("guidePrew3")
    var swipe: SwipeClass?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        swipe = SwipeClass(viewController: self,
                           leftAction: {[weak self] in
            let view = SecondViewController()
            self?.navigationController?.pushViewController(view, animated: true)
        },
                           rightAction: {[weak self] in self?.navigationController?.popViewController(animated: true)})
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
}

