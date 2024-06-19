//
//  NotesModel.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi R. on 19.06.24.
//

import UIKit

class NotesModel {
    
    let label = Label.label(text: "Notes", fontSize: 25)
    
    func updateUI(view: UIView) {
        
        view.addSubview(label)
        
        Layout.applyView(label, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0)
    }
}
