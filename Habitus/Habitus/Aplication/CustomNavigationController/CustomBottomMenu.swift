//  CustomBottomMenu.swift

//  Habitus

//  Created by Bobbi R. on 13.07.24.

import UIKit
import ElementBuilder

class CustomBottomMenu: UIView {
    
    var homeButton: UIButton!
    var cartButton: UIButton!
    var favoriteButton: UIButton!

//    var favoriteButton = ButtonsWithAction.createButtonWithSystemImage(systemName: "gear", setImage: nil)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        
//        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 30
        self.layer.masksToBounds = true
//        self.layer.shadowColor = UIColor.red.cgColor
//        self.layer.shadowOffset = CGSize(width: 4, height: 4)
//        self.layer.shadowOpacity = 1
        self.backgroundColor = .lightGray
        
       homeButton = createButton(imageName: "list.bullet.circle", setImage: nil)
        addSubview(homeButton)
        
        // Cart Button
        cartButton = createButton(imageName: "pencil.circle", setImage: nil)
        addSubview(cartButton)
        
        
        // Favorite Button
        favoriteButton = createButton(imageName: "gear", setImage: nil)
        addSubview(favoriteButton)
        
        // Layout
        let stackView = UIStackView(arrangedSubviews: [homeButton, cartButton, favoriteButton ])
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func createButton(imageName: String, setImage: UIImage?) -> UIButton {
        let button = UIButton()
        let image = setImage ?? UIImage(systemName: imageName)
        let newSize = CGSize(width: 34, height: 34)
        UIGraphicsBeginImageContext(newSize)
        image?.draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        button.setImage(newImage, for: .normal)
//        button.alpha = 0.5
        button.layer.cornerRadius = 360
        return button
    }
}
