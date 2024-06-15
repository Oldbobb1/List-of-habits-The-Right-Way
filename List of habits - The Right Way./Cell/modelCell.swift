//
//  ModelCell.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi on 6.06.24.
//

import UIKit

//struct NewsWithLocationModel {
//    let name: String
//  
//}

struct Emoji {
    var emoji: String
    var name: String
    var description: String
    var isFavourite: Bool
}


class EmojiTableViewCell: UITableViewCell {

    var emojiLabel = UILabel()
    var nameLabel = UILabel()
    var descriptionLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(emojiLabel)
        addSubview(nameLabel)
        addSubview(descriptionLabel)
        
        emojiLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(emojiLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(object: Emoji) {
        self.emojiLabel.text = object.emoji
        self.nameLabel.text = object.name
        self.descriptionLabel.text = object.description
    }
}

