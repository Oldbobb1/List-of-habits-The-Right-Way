//  SwipeClass.swift

//  Habitus

//  Created by Bobbi R. on 9.07.24.

import UIKit

public class SwipeClass {

    typealias SwipeAction = () -> Void

    weak var viewController: UIViewController?
    private var leftAction: SwipeAction?, rightAction: SwipeAction?

    init(viewController:UIViewController,leftAction: @escaping SwipeAction ,rightAction: @escaping SwipeAction ) {
        self.viewController = viewController
        self.leftAction = leftAction
        self.rightAction = rightAction
        setupSwipe()
    }

    private func setupSwipe() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        swipeLeft.direction = .left
        viewController?.view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        swipeRight.direction = .right
        viewController?.view.addGestureRecognizer(swipeRight)
    }

    @objc private func swipeLeft() {
        leftAction?()
    }

    @objc private func swipeRight() {
        rightAction?()
    }
}
