//  BackupСopyVC.swift

//  Habitus

//  Created by Bobbi R. on 9.07.24.

import UIKit
import ElementBuilder

class BackupСopyVC: UIViewController {
    
    let label = Label.label(text: "subscribe", fontSize: 25, weight: .heavy, textColor: .black, textAlignment: .center)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        
        Layout.applyView(label, view: view, topOffset: 20, leadingOffset: 10, trailingOffset: -10)
    }
}
