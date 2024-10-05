//
//  SetupCell3.swift
//  Habitus
//
//  Created by Bobbi R. on 15.09.24.
//

import UIKit
import ElementBuilder


class SetupCell3: UITableViewCell {
    
    let buttonCloseUIView = ButtonsWithAction.makeButton(setTitle:"Sign in Apple", cornerRadius: 18, content: .center, setTitleColor: .label, font: .boldSystemFont(ofSize: 20), configuration: .plain(), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "apple.logo",setImage: nil, imageSize:CGSize(width: 20, height: 25),alpha: 1, shadowColor:UIColor.black.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4, tintColor: UIColor(named: "daysModelTextColor"))
    
    let buttonCloseUIView2 = ButtonsWithAction.makeButton(setTitle:"LogOut" ,cornerRadius: 0, content: .center, setTitleColor: .label, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "arrowshape.turn.up.left",setImage: nil, imageSize:CGSize(width: 30, height: 30),alpha: 1, shadowColor:UIColor.black.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
   
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
        stackView.spacing = 1 // Отступ между контейнерами
//                stackView.backgroundColor = .green
        stackView.isLayoutMarginsRelativeArrangement = true
               stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView

        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(stackView)
        stackView.addArrangedSubview(buttonCloseUIView2)
        stackView.addArrangedSubview(buttonCloseUIView)
        
        buttonCloseUIView2.isHidden = true

        layout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1)
              make.height.equalTo(65)// Высота stackView
          }
        
    }
    
    @objc func signInWithApple() { }
    
    func backup() {

    }

}
