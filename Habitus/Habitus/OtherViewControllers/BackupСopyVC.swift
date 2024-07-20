import SwiftUI
import UIKit
import ElementBuilder


class BackupСopyVC: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
 
    }
    
}




struct ViewControllerProvider8: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            BackupСopyVC()
        }.edgesIgnoringSafeArea(.all)
    }
}
