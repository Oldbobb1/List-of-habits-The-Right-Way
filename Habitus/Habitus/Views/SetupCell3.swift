//
//  SetupCell3.swift
//  Habitus
//
//  Created by Bobbi R. on 15.09.24.
//

import UIKit
import ElementBuilder


class SetupCell3: UITableViewCell {
    
    let buttonCloseUIView = ButtonsWithAction.makeButton(setTitle:"Sign in Apple", cornerRadius: 18, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), configuration: .plain(), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "apple.logo",setImage: nil, imageSize:CGSize(width: 20, height: 25),alpha: 1, shadowColor:UIColor.gray.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
    
    let buttonCloseUIView1 = ButtonsWithAction.makeButton(setTitle:"Backup" ,cornerRadius: 0, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "icloud.and.arrow.up",setImage: nil, imageSize:CGSize(width: 30, height: 30),alpha: 1, shadowColor:UIColor.gray.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)


    let buttonCloseUIView2 = ButtonsWithAction.makeButton(setTitle:"LogOut" ,cornerRadius: 0, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "arrowshape.turn.up.left",setImage: nil, imageSize:CGSize(width: 30, height: 30),alpha: 1, shadowColor:UIColor.gray.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
   
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
    
    let stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
        stackView.spacing = 5 // Отступ между контейнерами
//                stackView.backgroundColor = .green
        stackView.isLayoutMarginsRelativeArrangement = true
               stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView

        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        buttonCloseUIView1.isHidden = true ; buttonCloseUIView2.isHidden = true
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(buttonCloseUIView1)
        stackView.addArrangedSubview(buttonCloseUIView2)
        
//        stackView1.addArrangedSubview(buttonCloseUIView1)
        stackView.addArrangedSubview(buttonCloseUIView)
        
        
        buttonCloseUIView2.isHidden = true
        buttonCloseUIView1.isHidden = true
        
//        contentView.addSubview(stackView1)
        
        layout()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1)
//              make.top.equalToSuperview().inset(1) // Отступ сверху
//              make.leading.trailing.equalToSuperview().inset(20) // Горизонтальные отступы
//            make.trailing.equalToSuperview().inset(175)
              make.height.equalTo(65)// Высота stackView
//            make.width.equalToSuperview().inset(90)
          }
        
    }
    
//    @objc func signInWithApple() {
//        // Здесь должна быть логика входа через Apple (например, запрос на аутентификацию)
//        // После успешного входа, отображаем скрытые кнопки
//
//        // Пример: после успешного входа
//        buttonCloseUIView1.isHidden = false
//        buttonCloseUIView2.isHidden = false
//    }
}









class SetupCell4: UITableViewCell {
    
    let buttonCloseUIView = ButtonsWithAction.makeButton(setTitle:"Sign in Apple", cornerRadius: 25, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), configuration: .plain(), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "apple.logo",setImage: nil, imageSize:CGSize(width: 20, height: 25),alpha: 1, shadowColor:UIColor.gray.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
//
//
//    let buttonCloseUIView1 = ButtonsWithAction.makeButton(setTitle:"Backup" ,cornerRadius: 15, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "icloud.and.arrow.up",setImage: nil, imageSize:CGSize(width: 30, height: 30),alpha: 1, shadowColor:UIColor.black.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
//
//
//    let buttonCloseUIView2 = ButtonsWithAction.makeButton(setTitle:"LogOut" ,cornerRadius: 15, content: .center, setTitleColor: .darkGray, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, systemName: "arrowshape.turn.up.left",setImage: nil, imageSize:CGSize(width: 30, height: 30),alpha: 1, shadowColor:UIColor.black.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
        stackView.spacing = 5 // Отступ между контейнерами
//                stackView.backgroundColor = .green
        stackView.isLayoutMarginsRelativeArrangement = true
               stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView

        return stackView
    }()
    
//    let stackView1: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.distribution = .fillEqually
//        stackView.layer.cornerRadius = 15
//        stackView.spacing = 5 // Отступ между контейнерами
//                stackView.backgroundColor = .green
//        stackView.isLayoutMarginsRelativeArrangement = true
//               stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView
//
//        return stackView
//    }()
//
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        buttonCloseUIView1.isHidden = true ; buttonCloseUIView2.isHidden = true
        contentView.clipsToBounds = true
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(buttonCloseUIView)
        
//        stackView1.addArrangedSubview(buttonCloseUIView1)
//        stackView1.addArrangedSubview(buttonCloseUIView2)
        
        
//        contentView.addSubview(stackView1)
        
        layout()
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout(){
        
//        stackView.snp.makeConstraints { make in
//              make.edges.equalToSuperview().inset(5) // Добавляем отступы от краев
//              make.height.equalTo(40) // Высота stackView
//          }
        
        stackView.snp.makeConstraints { make in
              make.top.equalToSuperview().inset(1) // Отступ сверху
//              make.leading.trailing.equalToSuperview().inset(80) // Горизонтальные отступы
            make.centerX.equalToSuperview()
              make.height.equalTo(80) // Высота stackView
            make.bottom.equalToSuperview().inset(1)
            make.width.equalToSuperview().inset(90)
          }
//
//          // Размещение stackView1 под stackView
//          stackView1.snp.makeConstraints { make in
//              make.top.equalTo(stackView.snp.bottom).offset(5) // Отступ сверху от stackView
//              make.leading.trailing.equalToSuperview().inset(5) // Горизонтальные отступы
//              make.height.equalTo(40) // Высота stackView1
//              make.bottom.equalToSuperview().inset(5) // Отступ снизу
//          }
        
//        stackView.snp.makeConstraints { make in
//              make.top.equalToSuperview().inset(1) // Отступ сверху
//              make.leading.trailing.equalToSuperview().inset(10) // Горизонтальные отступы
////            make.trailing.equalToSuperview().inset(175)
//              make.height.equalTo(60)// Высота stackView
//            make.width.equalToSuperview().inset(90)
//          }
//
//        stackView1.snp.makeConstraints { make in
//            make.top.equalTo(stackView.snp.bottom).offset(20) // Отступ сверху от stackView
////              make.leading.trailing.equalToSuperview().inset(1) // Горизонтальные отступы
//            make.trailing.equalToSuperview().inset(1)
//            make.height.equalTo(60) // Высота stackView1
//            make.bottom.equalToSuperview().inset(1) // Отступ снизу
//            make.width.equalToSuperview().inset(95)
//        }
        
    }
    
//    @objc func signInWithApple() {
//        // Здесь должна быть логика входа через Apple (например, запрос на аутентификацию)
//        // После успешного входа, отображаем скрытые кнопки
//
//        // Пример: после успешного входа
//        buttonCloseUIView1.isHidden = false
//        buttonCloseUIView2.isHidden = false
//    }
}





//class SetupCell4: UITableViewCell {
//
//    // Первая кнопка
//    let buttonCloseUIView = ButtonsWithAction.makeButton(
//        setTitle: "Sign in Apple",
//        cornerRadius: 15,
//        content: .center,
//        setTitleColor: .darkGray,
//        font: .boldSystemFont(ofSize: 20),
//        configuration: .plain(),
//        clipsToBounds: false,
//        backgroundColor: .systemGray6,
//        systemName: "apple.logo",
//        setImage: nil,
//        imageSize: CGSize(width: 20, height: 25),
//        alpha: 1,
//        shadowColor: UIColor.black.cgColor,
//        shadowOffset: CGSize(width: 0, height: 2),
//        shadowOpacity: 0.6,
//        shadowRadius: 4
//    )
//
//    // Вторая кнопка
//    let buttonCloseUIView2 = ButtonsWithAction.makeButton(
//        setTitle: "LogOut",
//        cornerRadius: 15,
//        content: .center,
//        setTitleColor: .darkGray,
//        font: .boldSystemFont(ofSize: 20),
//        clipsToBounds: false,
//        backgroundColor: .systemGray6,
//        systemName: "arrowshape.turn.up.left",
//        setImage: nil,
//        imageSize: CGSize(width: 30, height: 30),
//        alpha: 1,
//        shadowColor: UIColor.black.cgColor,
//        shadowOffset: CGSize(width: 0, height: 2),
//        shadowOpacity: 0.6,
//        shadowRadius: 4
//    )
//
//    let stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.distribution = .fillEqually
//        stackView.layer.cornerRadius = 15
//        stackView.spacing = 5 // Отступ между контейнерами
//        stackView.backgroundColor = .green
//        stackView.isLayoutMarginsRelativeArrangement = true
//        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView
//        return stackView
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        contentView.clipsToBounds = true
//        contentView.addSubview(stackView)
//        stackView.addArrangedSubview(buttonCloseUIView) // Добавляем первую кнопку
//        layout()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    // Функция для замены кнопки
//    func updateButton(isLoggedIn: Bool) {
//        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() } // Удаляем все сабвью из stackView
//
//        if isLoggedIn {
//            stackView.addArrangedSubview(buttonCloseUIView2) // Добавляем вторую кнопку при удачном входе
//        } else {
//            stackView.addArrangedSubview(buttonCloseUIView) // Добавляем первую кнопку при неудачном входе
//        }
//    }
//
//    func layout() {
//        stackView.snp.makeConstraints { make in
//            make.top.equalToSuperview().inset(1) // Отступ сверху
//            make.centerX.equalToSuperview()
//            make.height.equalTo(60) // Высота stackView
//            make.bottom.equalToSuperview().inset(1)
//            make.width.equalToSuperview().inset(90)
//        }
//    }
//}
