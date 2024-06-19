//  GuideModel.swift

//  List of habits - The Right Way.

//  Created by Bobbi R. on 19.06.24.

import UIKit

class GuideModel {
    
    let label = Label.label(text: "Habits", fontSize: 20)
    let label1 = Label.label(text: "Habits поможет вам завести и поддерживать полезные привычки, позволяя улучшить свою жизнь.", fontSize: 15)
    let imageView = Image.createImage("guidePrew")
    
    func updateUI(view:UIView) {
        
        view.backgroundColor = UIColor.systemBackground
        
        view.addSubview(label); view.addSubview(label1); view.addSubview(imageView)
        
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
}
