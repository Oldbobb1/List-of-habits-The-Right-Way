//
//  Layout.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi on 14.06.24.
//

import UIKit
import SnapKit

//class Layout {
//    
//    static func applyView(_ element: UIView, view: UIView,  topOffset: CGFloat, leadingOffset: CGFloat, trailingOffset: CGFloat) {
//        element.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(topOffset)
//            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(leadingOffset)
//            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(trailingOffset)
//        }
//    }
//
//}

struct Layout {
    static func applyView(_ element: UIView, view: UIView, topOffset: CGFloat? = nil, leadingOffset: CGFloat? = nil, trailingOffset: CGFloat? = nil, bottomOffset: CGFloat? = nil, additionalConstraints: ((ConstraintMaker) -> Void)...) {
        element.snp.makeConstraints { make in
            if let topOffset = topOffset {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(topOffset)
            }
            if let leadingOffset = leadingOffset {
                make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(leadingOffset)
            }
            if let trailingOffset = trailingOffset {
                make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(trailingOffset)
            }
            if let bottomOffset = bottomOffset {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(bottomOffset)
            }
            for constraint in additionalConstraints {
                constraint(make)
            }
        }
    }
}




