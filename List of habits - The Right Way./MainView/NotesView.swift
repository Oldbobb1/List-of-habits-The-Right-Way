//
//  NotesView.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi R. on 27.06.24.
//

import UIKit

class NotesView {
    
    let label = Label.label(text: "Notes", fontSize: 25)
    
    func updateUI(_ view: UIView) {
        
        view.addSubview(label)
        
        Layout.applyView(label, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0)
    }
}
