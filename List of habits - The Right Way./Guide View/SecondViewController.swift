//  SecondViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 7.06.24.

import UIKit

class SecondViewController: UIViewController{
    
    let label = Label.label(text: "Отметки", fontSize: 20)
    let label1 = Label.label(text: "Отметьте выполнение привычки в указанный день.С каждым повторением вы делаете шаг вперед, а с каждым пропуском - два шага назад.", fontSize: 15)
//    let imageView = Image.createImage("")
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
            let view = ThirdViewController()
            self?.navigationController?.pushViewController(view, animated: true)
        },
                           rightAction: { [weak self] in self?.navigationController?.popViewController(animated: true)})
    }

    private func updateUI() {
        
        view.backgroundColor = UIColor.systemBackground
        view.addSubview(label)
        view.addSubview(label1)
        //        self.view.addSubview(imageView)
        
        //        imageView.snp.makeConstraints { (make) in
        //                    make.centerX.equalToSuperview()
        //                    make.centerY.equalToSuperview()
        //                    make.width.equalTo(300)
        //                    make.height.equalTo(300)
        //                }
                
        Layout.applyView(label, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: -80 )
        Layout.applyView(label1, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: -20 )
    }
    
}
