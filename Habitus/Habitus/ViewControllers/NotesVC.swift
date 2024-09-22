import SwiftUI
import SnapKit
import UIKit


class NotesVC: UIViewController {
    
    let notesView = NotesUI()
    
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemTeal.cgColor, UIColor.systemPink.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()
    

    
    private func setupGradientBackground() {
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGradientBackground()
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






