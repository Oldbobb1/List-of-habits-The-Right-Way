//  Layout.swift

//  Habitus

//  Created by Bobbi R. on 9.07.24.

import UIKit
import SnapKit

struct Layout  {

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
