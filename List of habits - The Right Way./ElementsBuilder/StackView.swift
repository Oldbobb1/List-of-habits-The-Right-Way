//
//  stack.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi on 6.06.24.
//

import UIKit

class StackView {
   static func stack() -> UIStackView {
        let stack = UIStackView()
        //    stack.backgroundColor = .lightGray
        //    stack.backgroundColor = UIColor.systemBackground
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}

