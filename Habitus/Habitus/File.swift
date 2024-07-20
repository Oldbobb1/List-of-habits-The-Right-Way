//
//  File.swift
//  Habitus
//
//  Created by Bobbi R. on 20.07.24.
//

import UIKit

//func applyNeomorphism(to view: UIView) {
    
//       view.layer.shadowColor = UIColor.systemGray6.cgColor
//       view.layer.shadowOffset = CGSize(width: -1, height: 5)
//    view.layer.shadowOpacity = 1.0
//       view.layer.shadowRadius = 20
//    view.layer.contentsGravity = .resizeAspect
    
//       let innerShadowLayer = CALayer()
//       innerShadowLayer.frame = view.bounds
//    let shadowPath = UIBezierPath(roundedRect: innerShadowLayer.bounds.insetBy(dx: -10, dy: -10), cornerRadius: view.layer.cornerRadius)
//       let innerPath = UIBezierPath(roundedRect: innerShadowLayer.bounds, cornerRadius: view.layer.cornerRadius).reversing()
//       shadowPath.append(innerPath)
//       innerShadowLayer.shadowPath = shadowPath.cgPath
//       innerShadowLayer.masksToBounds = true
//       innerShadowLayer.shadowColor = UIColor.systemGray6.cgColor
//       innerShadowLayer.shadowOffset = CGSize(width: -5, height: -5)
//       innerShadowLayer.shadowOpacity = 0.7
//       innerShadowLayer.shadowRadius = 10
//       view.layer.addSublayer(innerShadowLayer)
//   }




func applyNeomorphism(to view: UIView, cornerRadius: CGFloat = 10.0, lightColor: UIColor = .white, darkColor: UIColor = .darkGray, backgroundColor: UIColor = .systemGray6) {
    view.layer.cornerRadius = cornerRadius
    view.backgroundColor = backgroundColor

    // Создаем светлую тень
    let lightShadow = UIView(frame: view.frame)
    lightShadow.backgroundColor = lightColor.withAlphaComponent(0.6)
    lightShadow.layer.cornerRadius = cornerRadius
    lightShadow.layer.masksToBounds = true
    lightShadow.layer.position = CGPoint(x: view.center.x - 5, y: view.center.y - 5)
    lightShadow.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    // Создаем темную тень
    let darkShadow = UIView(frame: view.frame)
    darkShadow.backgroundColor = darkColor.withAlphaComponent(0.3)
    darkShadow.layer.cornerRadius = cornerRadius
    darkShadow.layer.masksToBounds = true
    darkShadow.layer.position = CGPoint(x: view.center.x + 5, y: view.center.y + 5)
    darkShadow.autoresizingMask = [.flexibleWidth, .flexibleHeight]

    // Добавляем тени и саму вьюшку
    if let superview = view.superview {
        superview.insertSubview(lightShadow, belowSubview: view)
        superview.insertSubview(darkShadow, belowSubview: lightShadow)
    }
}
