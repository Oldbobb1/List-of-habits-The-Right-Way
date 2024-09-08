import UIKit
import SnapKit
import ElementBuilder


class ProfileTableViewCell: UITableViewCell {
    
    let profileImageView = Image.image("person.circle.fill", cornerRadius: 35, contentMode: .scaleAspectFill)
    
    let profileLabel = Label.label(text: "", fontSize: 18, weight: .medium, textColor: .label, textAlignment: .center, backgroundColor: .clear)
    
    let profileSubtitleLabel = Label.label(text: "", fontSize: 14, weight: .regular, textColor: .gray, textAlignment: .center, backgroundColor: .clear)
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6
        containerView.layer.cornerRadius = 15
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowOpacity = 0.6
        containerView.layer.shadowRadius = 4
        return containerView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
        stackView.spacing = 5 // Отступ между контейнерами
        stackView.backgroundColor = .green
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        contentView.addSubview(profileImageView)
//        contentView.addSubview(profileLabel)
//        contentView.addSubview(profileSubtitleLabel)
        
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(profileLabel)
        containerView.addSubview(profileSubtitleLabel)
        
        
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5) // Добавляем отступы от краев
            make.height.equalTo(80) // Высота stackView
        }
        
        Layout.applyView(profileImageView, view: contentView, additionalConstraints: { make in
            make.centerY.equalTo(self.contentView.snp.centerY)
            make.width.equalTo(70)
            make.height.equalTo(70)
        })
        
        Layout.applyView(profileLabel, view: contentView, topOffset: 16, leadingOffset: 86)
        
        profileSubtitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.top.equalTo(profileLabel.snp.bottom).offset(15)
            make.bottom.lessThanOrEqualTo(containerView.snp.bottom).offset(-10)
        }
    }
    
    func configure(profileImage: UIImage?, name: String, subtitle: String) {
        profileImageView.image = profileImage
        profileLabel.text = name
        profileSubtitleLabel.text = subtitle
    }
}

