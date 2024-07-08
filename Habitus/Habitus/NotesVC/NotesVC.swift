//
//  File.swift
//  Habitus
//
//  Created by Bobbi R. on 7.07.24.
//

 import UIKit

class NotesVC: UIViewController {
    
    var notesView = NotesViewUI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        notesView.initializeUI(view)
    
    }
    
}
