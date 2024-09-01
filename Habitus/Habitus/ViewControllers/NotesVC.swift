import SwiftUI
import SnapKit
import UIKit


class NotesVC: UIViewController {
    
    let notesView = NotesUI()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()

        notesView.initializeUI(view)
        
    }
 
}




struct ViewControllerProvider2: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            NotesVC()
        }.edgesIgnoringSafeArea(.all)
    }
}
