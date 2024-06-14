//  NotesViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit



class NotesViewController: UIViewController {
   
    let label = Label.label(text: "Notes", fontSize: 25)
 
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        

        Layout.applyView(label, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0)
        
    }
    
}


