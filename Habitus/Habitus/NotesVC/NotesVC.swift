//  NotesVC.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import UIKit

class NotesVC: UIViewController {
    
    let notesView = NotesViewUI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesView.initializeUI(view)
    }
    
}
