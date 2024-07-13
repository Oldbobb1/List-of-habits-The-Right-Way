//  NotesViewUI.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import UIKit
import ElementBuilder

class NotesViewUI  {
    
    let titleLabel = Label.label(text: "Notes", fontSize: 25, weight:.bold, textColor: nil, textAlignment: .center)
    
    func initializeUI(_ view: UIView) {
        
        view.addSubview(titleLabel)
        
//        titleLabel.layer.cornerRadius = 10
//        titleLabel.layer.shadowColor = UIColor.black.cgColor
//        titleLabel.layer.shadowOffset = CGSize(width: 0, height: 4)
//        titleLabel.layer.shadowOpacity = 0.5
//        titleLabel.layer.shadowRadius = 4
        
        Layout.applyView(titleLabel, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0)
    }
}
