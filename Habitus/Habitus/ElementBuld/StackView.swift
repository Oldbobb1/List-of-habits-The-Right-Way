//  StackView.swift

//  Habitus

//  Created by Bobbi R. on 9.07.24.

import UIKit

public class StackView {
    public  static func stackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
}
