import UIKit
import ElementBuilder


class SetupCell: UITableViewCell {
    
    let switchButton: UISwitch = {
        let switchButton = UISwitch()
        switchButton.onTintColor = .systemBlue
        switchButton.layer.cornerRadius = 20
        return switchButton
    }()
    
    let switchButton1: UISwitch = {
        let switchButton = UISwitch()
        switchButton.onTintColor = .systemBlue
        switchButton.layer.cornerRadius = 20
        return switchButton
    }()
    
    let welcomeImageView: UIImageView = {
        let welcomeImageView = UIImageView()
        welcomeImageView.image = UIImage(systemName: "moon.stars.fill")
        welcomeImageView.contentMode = .scaleAspectFit
        welcomeImageView.tintColor = .red
        return welcomeImageView
    }()
    
    let welcomeImageView1: UIImageView = {
        let welcomeImageView = UIImageView()
        welcomeImageView.image = UIImage(systemName: "bell.and.waves.left.and.right.fill")
        welcomeImageView.contentMode = .scaleAspectFit
        welcomeImageView.tintColor = .red
        return welcomeImageView
    }()
    
    let messageLabel = Label.label(text: "Dark Theme", fontSize: 20, weight: .bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    
    let messageLabel1 = Label.label(text: "Notifications", fontSize: 20, weight: .bold, textColor: nil, textAlignment: .center, backgroundColor: .clear)
    
    let container = containerView(backgroundColor:.systemGray6,cornerRadius: 18,shadowColor: UIColor.darkGray.cgColor,shadowOffset: .init(width: -1, height: -1),shadowOpacity: 1, shadowRadius: 3)
    
    let container1 = containerView(backgroundColor:.systemGray6,cornerRadius: 18,shadowColor: UIColor.darkGray.cgColor,shadowOffset: .init(width: 0, height: 1),shadowOpacity: 1, shadowRadius: 3)
    
    let stackView = StackView.stackView(axis: .vertical, distribution: .fillEqually, backgroundColor: .clear, spacing: 1, layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10))
    

    weak var views: SettingVC?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true

        stackView.addArrangedSubview(container)
        stackView.addArrangedSubview(container1)

        contentView.addSubview(stackView)

        container.addSubview(switchButton)
        container.addSubview(welcomeImageView)
        container.addSubview(messageLabel)
        
        
        container1.addSubview(switchButton1)
        container1.addSubview(welcomeImageView1)
        container1.addSubview(messageLabel1)
        
        
        container.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        container1.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

        layout()
        
        let switchState = UserDefaults.standard.bool(forKey: "switchState")
        switchButton.isOn = switchState
//        switchButton.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        
        switchButton.addAction(UIAction(handler: {[weak self] _ in
            guard let self = self else {return}
            self.switchValueChanged(switchButton)
        }), for: .valueChanged)
        
        let switchState1 = UserDefaults.standard.bool(forKey: "switchState1")
        switchButton1.isOn = switchState1
//        switchButton1.addTarget(self, action: #selector(switchValueChanged1), for: .valueChanged)
        
        switchButton1.addAction(UIAction(handler: {[weak self] _ in
            guard let self = self else {return}
            self.switchValueChanged1(switchButton1)
        }), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1)
              make.height.equalTo(100)// Высота stackView
          }
    
        switchButton.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-25)
            make.width.height.equalTo(30)
        }
        
        welcomeImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(7)
            make.width.height.equalTo(30)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            //            make.centerY.equalToSuperview()
            //            make.leading.equalToSuperview().offset(10)
            make.leading.equalTo(welcomeImageView.snp.trailing).offset(1)
            make.trailing.equalTo(switchButton.snp.leading).offset(-1)
        }
        
        switchButton1.snp.makeConstraints{make in
            make.top.equalToSuperview().offset(5)
            make.trailing.equalToSuperview().offset(-25)
            make.width.height.equalTo(30)
        }
        
        welcomeImageView1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(7)
            make.width.height.equalTo(35)
        }
        
        messageLabel1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            //            make.centerY.equalToSuperview()
            //            make.leading.equalToSuperview().offset(10)
            make.leading.equalTo(welcomeImageView1.snp.trailing).offset(1)
            make.trailing.equalTo(switchButton1.snp.leading).offset(-1)
        }
    }
    
     func switchValueChanged(_ sender: UISwitch) {
    //    let index = sender.tag
    //    if index == 0 {
            if sender.isOn {
                UserDefaults.standard.set("dark", forKey: "theme")
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let window = windowScene.windows.first {
                    window.overrideUserInterfaceStyle = .dark
                }
            } else {
                UserDefaults.standard.removeObject(forKey: "theme")
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let window = windowScene.windows.first {
                    window.overrideUserInterfaceStyle = .unspecified
                }
            }

        UserDefaults.standard.set(sender.isOn, forKey: "switchState")
    }
    
     func switchValueChanged1(_ sender: UISwitch) {
            if sender.isOn {
                requestNotificationAuthorization { granted in
                    if !granted {
                        self.showAuthorizationAlert(sender: sender)
                    } else { }
                }
            } else {
                UserDefaults.standard.set(false, forKey: "notificationsEnabled")
                UIApplication.shared.unregisterForRemoteNotifications()
            }
        
        UserDefaults.standard.set(sender.isOn, forKey: "switchState1")
    }

     func showAuthorizationAlert(sender: UISwitch) {
        let alert = UIAlertController(title: "Уведомления отключены", message: "Для включения уведомлений, пожалуйста, разрешите их в настройках.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: { _ in
            sender.setOn(false, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Настройки", style: .default, handler: { _ in
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettings)
            }
        }))
         
         views?.present(alert, animated: true, completion: nil)
    }
    
    func requestNotificationAuthorization(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            DispatchQueue.main.async {
                if granted {
                    UserDefaults.standard.set(true, forKey: "notificationsEnabled")
                    UIApplication.shared.registerForRemoteNotifications()
                } else {
                    UserDefaults.standard.set(false, forKey: "notificationsEnabled")
                }
                completion(granted)
            }
        }
    }
}

//    let stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.distribution = .fillEqually
//        stackView.layer.cornerRadius = 15
//        stackView.spacing = 1 // Отступ между контейнерами
////               stackView.backgroundColor = .green
//        stackView.isLayoutMarginsRelativeArrangement = true
//        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView
//        return stackView
//    }()
    
