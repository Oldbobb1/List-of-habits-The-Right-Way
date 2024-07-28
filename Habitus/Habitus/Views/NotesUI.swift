import UIKit
import ElementBuilder


class NotesUI  {
    
    let titleLabel = Label.label(text: "Notes", fontSize: 25, weight:.bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    
    func initializeUI(_ view: UIView) {
        
        view.addSubview(titleLabel)
        layout(view)
        
    }
    
    func layout(_ view: UIView) {
        Layout.applyView(titleLabel, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0)
    }
}
