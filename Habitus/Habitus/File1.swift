//
//  File1.swift
//  Habitus
//
//  Created by Bobbi R. on 7.07.24.
//



import UIKit

import UIKit

class CustomColorPickerViewController: UIViewController {

    var colorButtons: [UIButton] = []
    var colorPreview: UIView!
    
    let colors: [UIColor] = [
        .red, .green, .blue, .yellow, .orange, .purple, .brown, .cyan, .magenta, .gray
    ]
    
    var selectedColor: UIColor = .white {
        didSet {
            colorPreview.backgroundColor = selectedColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupColorButtons()
        setupColorPreview()
    }
    
    func setupColorButtons() {
        let buttonSize: CGFloat = 50
        let spacing: CGFloat = 20
        let startX: CGFloat = 20
        let startY: CGFloat = 80
        
        for (index, color) in colors.enumerated() {
            let button = UIButton(frame: CGRect(
                x: startX + CGFloat(index % 5) * (buttonSize + spacing),
                y: startY + CGFloat(index / 5) * (buttonSize + spacing),
                width: buttonSize,
                height: buttonSize
            ))
            button.backgroundColor = color
            button.layer.cornerRadius = buttonSize / 2
            button.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
            view.addSubview(button)
            colorButtons.append(button)
        }
    }
    
    func setupColorPreview() {
        colorPreview = UIView(frame: CGRect(x: 20, y: 220, width: 100, height: 100))
        colorPreview.backgroundColor = selectedColor
        view.addSubview(colorPreview)
    }
    
    @objc func colorButtonTapped(sender: UIButton) {
        if let index = colorButtons.firstIndex(of: sender) {
            selectedColor = colors[index]
        }
    }
}

