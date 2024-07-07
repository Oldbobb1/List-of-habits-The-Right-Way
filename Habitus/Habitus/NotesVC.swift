//
//  File.swift
//  Habitus
//
//  Created by Bobbi R. on 7.07.24.
//

import UIKit


class NotesDataModel {

}


class NotesViewUI  {
    
    let titleLabel = Label.label(text: "Notes", fontSize: 25, weight:.bold, textColor: nil)
    
    func initializeUI(_ view: UIView) {
        
        view.addSubview(titleLabel)
        
        Layout.applyView(titleLabel, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0)
    }
}


class NotesVC: UIViewController {
    
    var notesView = NotesViewUI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        notesView.initializeUI(view)
    
    }
    
}

