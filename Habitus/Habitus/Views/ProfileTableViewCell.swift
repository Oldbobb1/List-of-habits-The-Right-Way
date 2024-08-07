import UIKit
import SnapKit
import ElementBuilder


class ProfileTableViewCell: UITableViewCell {
    
    let profileImageView = Image.image("person.circle.fill", cornerRadius: 35, contentMode: .scaleAspectFill)
    
    let profileLabel = Label.label(text: "", fontSize: 18, weight: .medium, textColor: .label, textAlignment: .center, backgroundColor: .clear)
    
    let profileSubtitleLabel = Label.label(text: "", fontSize: 14, weight: .regular, textColor: .gray, textAlignment: .center, backgroundColor: .clear)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(profileImageView)
        contentView.addSubview(profileLabel)
        contentView.addSubview(profileSubtitleLabel)

        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        Layout.applyView(profileImageView, view: contentView, additionalConstraints: { make in
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.width.equalTo(70)
            make.height.equalTo(70)
        })
        
        Layout.applyView(profileLabel, view: contentView, topOffset: 16, leadingOffset: 86)
        
        profileSubtitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.top.equalTo(profileLabel.snp.bottom).offset(4)
            make.bottom.lessThanOrEqualTo(contentView.snp.bottom).offset(-16)
        }
    }
    
    func configure(profileImage: UIImage?, name: String, subtitle: String) {
        profileImageView.image = profileImage
        profileLabel.text = name
        profileSubtitleLabel.text = subtitle
    }
}

