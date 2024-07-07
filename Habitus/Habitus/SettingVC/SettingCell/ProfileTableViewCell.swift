//
//  ProfileTableViewCell.swift
//  Habitus
//
//  Created by Bobbi R. on 7.07.24.
//

import UIKit


class ProfileTableViewCell: UITableViewCell {
    
    let profileImageView = Image.image("person.circle.fill", cornerRadius: 35, contentMode: .scaleAspectFill)
    let profileLabel = Label.label(text: "", fontSize: 18, weight: .medium, textColor: .label)
    let profileSubtitleLabel = Label.label(text: "", fontSize: 14, weight: .regular, textColor: .gray)
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(profileLabel)
        contentView.addSubview(profileSubtitleLabel)
        
        profileImageView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(16)
            make.centerY.equalTo(contentView.snp.centerY)
            make.width.equalTo(70)
            make.height.equalTo(70)
        }
    
        profileLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.top.equalTo(contentView.snp.top).offset(16)
//            make.trailing.equalTo(profileArrowImageView.snp.leading).offset(-16)
        }
    
        profileSubtitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.top.equalTo(profileLabel.snp.bottom).offset(4)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-16) // Добавлено ограничение по нижней границе
        }
        
//        profileSubtitleLabel.snp.makeConstraints { make in
//            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
//            make.top.equalTo(profileLabel.snp.bottom).offset(4)
////            make.trailing.equalTo(profileArrowImageView.snp.leading).offset(-16)
//        }
 
//        contentView.snp.makeConstraints { make in
//            make.height.equalTo(80)
////            make.leading.equalTo(0.5)
////            make.trailing.equalTo(-0.5)
//        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(profileImage: UIImage?, name: String, subtitle: String) {
        profileImageView.image = profileImage
        profileLabel.text = name
        profileSubtitleLabel.text = subtitle
    }
    
}
