import UIKit
import SnapKit
import ElementBuilder


class ProfileTableViewCell: UITableViewCell {
    
    let profileImageView = Image.image("person.circle", cornerRadius: 35, contentMode: .scaleAspectFit)
    
    let profileLabel = Label.label(text: "", fontSize: 18, weight: .medium, textColor: .label, textAlignment: .center, backgroundColor: .clear)
    
    let profileSubtitleLabel = Label.label(text: "", fontSize: 14, weight: .regular, textColor: .gray, textAlignment: .center, backgroundColor: .clear)
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6
        containerView.layer.cornerRadius = 25
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 1, height: 2)
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowRadius = 4
        return containerView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.layer.cornerRadius = 15
        stackView.spacing = 36 // Отступ между контейнерами
//        stackView.backgroundColor = .green
        
        stackView.isLayoutMarginsRelativeArrangement = true
               stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView

        return stackView
    }()
    
    let buttonCloseUIView1 = ButtonsWithAction.makeButton(setTitle:"Upgrade to Premium" ,cornerRadius: 15, content: .center, setTitleColor: .label, font: .boldSystemFont(ofSize: 20), clipsToBounds: false, backgroundColor: .systemGray6, shadowColor:UIColor.black.cgColor,shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.6, shadowRadius: 4)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(stackView)
        stackView.addArrangedSubview(containerView)
        containerView.addSubview(profileImageView)
        containerView.addSubview(profileLabel)
        containerView.addSubview(profileSubtitleLabel)
        
       
        stackView.addArrangedSubview(buttonCloseUIView1)
        
        layout()
        
        buttonCloseUIView1.addTarget(self, action: #selector(openSubscribeVC), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1) // Добавляем отступы от краев
//            make.leading.trailing.equalToSuperview().inset(100)
            make.height.equalTo(170) // Высота stackView
        }
        
        Layout.applyView(profileImageView, view: contentView, additionalConstraints: { make in
            make.centerY.equalTo(self.containerView.snp.centerY)
            make.width.equalTo(70)
            make.height.equalTo(70)
        })
        
        Layout.applyView(profileLabel, view: containerView, topOffset: 16, leadingOffset: 86)
        
        profileSubtitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.top.equalTo(profileLabel.snp.bottom).offset(15)
            make.bottom.lessThanOrEqualTo(containerView.snp.bottom).offset(-10)
        }

    }
    
    func configure(profileImage: UIImage?, name: String, subtitle: String) {
        profileImageView.image = profileImage
        profileLabel.text = name
        profileSubtitleLabel.text = subtitle
    }
    
    weak var views: SettingVC?
    
    @objc func openSubscribeVC() {
        let sub = SubscribeVC()
        sub.modalPresentationStyle = .fullScreen
        views?.present(sub, animated: true, completion: nil)
    }
}

