//  StackView.swift

//  Habitus

//  Created by Bobbi R. on 9.07.24.

import UIKit

public class StackView {
    public  static func stack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}
