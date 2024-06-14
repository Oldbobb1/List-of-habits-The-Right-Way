//  Labels.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class Label {
    
   static func label(text: String, fontSize: CGFloat ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.numberOfLines = 0
        return label
    }
    
}


