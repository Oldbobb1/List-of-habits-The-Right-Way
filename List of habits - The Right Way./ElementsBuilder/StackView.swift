//  stack.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

public class StackView {
    public  static func stack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}

