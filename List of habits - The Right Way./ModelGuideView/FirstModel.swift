//  FirstModel.swift

//  List of habits - The Right Way.

//  Created by Bobbi R. on 19.06.24.

import UIKit

class FirstModel {
    
    let label = Label.label(text: "Новая привычка", fontSize: 20)
    let label1 = Label.label(text: "Добавьте привычку, выберите цвет и укажите, с помощью гибких настроек, когда хотите получать уведомления. Здесь уведомления отсутсвуют в привычном виде, они похожи на будильник, чтобы точно не пропустить свою привычку.", fontSize: 15)
    let imageView = Image.createImage("guidePrew3")
    
    func updateUI(view: UIView) {
        
        view.backgroundColor = UIColor.systemBackground
    
        view.addSubview(label); view.addSubview(label1); view.addSubview(imageView)
        
        imageView.layer.cornerRadius = 30
        
        Layout.applyView(imageView, view: view, additionalConstraints: { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-50)
            make.width.equalTo(370)
            make.height.equalTo(470) // 450 - guidePrew2
        })
        Layout.applyView(label, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: -90 )
        Layout.applyView(label1, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: 10 )
    }
}
