// SecondModel.swift

//  List of habits - The Right Way.

//  Created by Bobbi R. on 19.06.24.

import  UIKit

class SecondModel{
    
    let label = Label.label(text: "Отметки", fontSize: 20)
    let label1 = Label.label(text: "Отметьте выполнение привычки в указанный день.С каждым повторением вы делаете шаг вперед, а с каждым пропуском - два шага назад.", fontSize: 15)
    //    let imageView = Image.createImage("")
    
    func updateUI(view: UIView) {
        
        view.backgroundColor = UIColor.systemBackground
            
        view.addSubview(label)
        view.addSubview(label1)
//        view.addSubview(imageView)
        
//        Layout.applyView(imageView, view: view, additionalConstraints: { (make) in
//            make.centerX.equalToSuperview()
//            make.centerY.equalToSuperview()
//            make.width.equalTo(300)
//            make.height.equalTo(300)
//        })
        Layout.applyView(label, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: -80 )
        Layout.applyView(label1, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: -20 )
    }
}
