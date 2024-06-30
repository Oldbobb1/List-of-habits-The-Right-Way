//  NotesViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class NotesViewController: UIViewController {
    
    var notesView = NotesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        notesView.updateUI(view)
    }
}
