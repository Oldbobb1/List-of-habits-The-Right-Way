import UIKit
import ElementBuilder


class SetupCell: UITableViewCell {
    
    let switchButton: UISwitch = {
        let switchButton = UISwitch()
        //            switchButton.isOn = isOn
        switchButton.onTintColor = .systemBlue
        switchButton.layer.cornerRadius = 20
        switchButton.layer.shadowColor = UIColor.black.cgColor
        switchButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        switchButton.layer.shadowOpacity = 0.4
        switchButton.layer.shadowRadius = 4
        return switchButton
    }()
    
    let switchButton1: UISwitch = {
        let switchButton = UISwitch()
        //            switchButton.isOn = isOn
        switchButton.onTintColor = .systemBlue
        switchButton.layer.cornerRadius = 20
        switchButton.layer.shadowColor = UIColor.black.cgColor
        switchButton.layer.shadowOffset = CGSize(width: 1, height: 2)
        switchButton.layer.shadowOpacity = 0.4
        switchButton.layer.shadowRadius = 4
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
    
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6                       // .systemGray6
        containerView.layer.cornerRadius = 18
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor    // systemGray
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowRadius = 4
        return containerView
    }()

    let containerView1: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6 // .systemGray6
        containerView.layer.cornerRadius = 18
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor             // .systemGray
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowRadius = 4
        return containerView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
        stackView.spacing = 1 // Отступ между контейнерами
//               stackView.backgroundColor = .green
        
        stackView.isLayoutMarginsRelativeArrangement = true
//               stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView

        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true

        stackView.addArrangedSubview(containerView)
        stackView.addArrangedSubview(containerView1)

        contentView.addSubview(stackView)

        containerView.addSubview(switchButton)
        containerView.addSubview(welcomeImageView)
        containerView.addSubview(messageLabel)
        
        
        containerView1.addSubview(switchButton1)
        containerView1.addSubview(welcomeImageView1)
        containerView1.addSubview(messageLabel1)
        
        
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        containerView1.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

        layout()
        
        let switchState = UserDefaults.standard.bool(forKey: "switchState")
        switchButton.isOn = switchState
        switchButton.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        
        let switchState1 = UserDefaults.standard.bool(forKey: "switchState1")
        switchButton1.isOn = switchState1
        switchButton1.addTarget(self, action: #selector(switchValueChanged1), for: .valueChanged)
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
    
    @objc func switchValueChanged(_ sender: UISwitch) {
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
    
    @objc func switchValueChanged1(_ sender: UISwitch) {
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
    weak var views: SettingVC?
    
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
