//  NotesViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class NotesViewController: UIViewController {
    
    var notes: NotesModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notes = NotesModel(); notes.updateUI(view: self.view)
    }
}
