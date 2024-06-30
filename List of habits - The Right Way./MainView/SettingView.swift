//
//  SettingView.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi R. on 27.06.24.
//

import UIKit
import AuthenticationServices

class SettingView {
    
    let label = Label.label(text: "Setting", fontSize: 25)
    let nameLabel = Label.label(text: "Sign In", fontSize: 18)
    let descriptionLabel = Label.label(text:"Apple ID", fontSize: 14)
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray5
//        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 12
//        containerView.layer.borderWidth = 1
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    let arrowImageView: UIImageView = {
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage(systemName: "chevron.right")
        arrowImageView.tintColor = .gray
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        return arrowImageView
    }()
    
    let profileImageView: UIImageView = {
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage(systemName: "person.circle")
        arrowImageView.layer.cornerRadius = 30 // Исправлено значение для радиуса
        arrowImageView.clipsToBounds = true
//        arrowImageView.tintColor = .gray
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        return arrowImageView
    }()

    
    let stackView = StackView.stack()
    let label1 = Label.label(text: "  Theme", fontSize: 18)
    let switchButt = ButtonsWithAction.createSwitchButton(isOn: false)
    
    let button1 = ButtonsWithAction.createButtonWithdAction(setTitle: "  Support", height: 40)
    let button2 = ButtonsWithAction.createButtonWithdAction(setTitle: "  Guidance ", height: 40)
    let button3 = ButtonsWithAction.createButtonWithdAction(setTitle: "  Rate the app", height: 40)
    let button4 = ButtonsWithAction.createButtonWithdAction(setTitle: "  Subscription", height: 40)
    
    let signInWithAppleButton = ASAuthorizationAppleIDButton(type: .signIn, style: .white)
    
    func updateUI(_ view: UIView) {
        
        view.addSubview(label)
        view.addSubview(containerView)
        
        containerView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(descriptionLabel)
//        containerView.addSubview(arrowImageView)
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(switchButt)
        
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
        view.addSubview(signInWithAppleButton)
        
        Layout.applyView(label, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0)
        
        Layout.applyView(containerView, view: view, topOffset: 40, leadingOffset: 10,trailingOffset: -10, additionalConstraints: {make in
            make.height.equalTo(80)
        })
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalTo(containerView.snp.leading).offset(16)
            make.centerY.equalTo(containerView)
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.top.equalTo(containerView.snp.top).offset(20)
//            make.trailing.equalTo(arrowImageView.snp.leading).offset(-16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
//            make.trailing.equalTo(arrowImageView.snp.leading).offset(-16)
        }
        
//        arrowImageView.snp.makeConstraints { make in
//            make.trailing.equalTo(containerView.snp.trailing).offset(-16)
//            make.centerY.equalTo(containerView)
//            make.width.equalTo(8)
//            make.height.equalTo(14)
//        }
        
        Layout.applyView(stackView, view: view, leadingOffset: 10, trailingOffset: -10 , additionalConstraints:  { make in
            make.top.equalTo(self.label.snp.bottom).offset(156)
            make.height.equalTo(40)
        })
        
//        Layout.applyView(label1, view: view, leadingOffset: 20, additionalConstraints:  {make in
//            make.top.equalToSuperview().offset(-2)
//        })
//        
        Layout.applyView(switchButt, view: view, trailingOffset: -14, additionalConstraints:  {make in
            make.top.equalToSuperview().offset(4)
        })
        
        Layout.applyView(button1, view: view, topOffset: 229, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(button2, view: view, topOffset: 272, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(button3, view: view, topOffset: 315, leadingOffset: 10, trailingOffset: -10)
        Layout.applyView(button4, view: view, topOffset: 358, leadingOffset: 10, trailingOffset: -10)
        
        Layout.applyView(signInWithAppleButton, view: view, topOffset: 401, leadingOffset: 10, trailingOffset: -10  ,additionalConstraints: { make in
            make.height.equalTo(40)
        })
        
        setupUI()
    }
    
    func setupUI() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textAlignment = .left
    
        label1.textAlignment = .left
        label1.textColor = .black
        stackView.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 1
        
        button1.layer.cornerRadius = 10
        button1.layer.borderWidth = 1
        button2.layer.cornerRadius = 10
        button2.layer.borderWidth = 1
        button3.layer.cornerRadius = 10
        button3.layer.borderWidth = 1
        button4.layer.cornerRadius = 10
        button4.layer.borderWidth = 1
    
        signInWithAppleButton.layer.cornerRadius = 10
        signInWithAppleButton.layer.borderWidth = 1
    }
    
    
}
