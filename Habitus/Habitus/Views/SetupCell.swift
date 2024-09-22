import UIKit
import ElementBuilder


class SetupCell: UITableViewCell {
    
    let switchButton: UISwitch = {
        let switchButton = UISwitch()
        //            switchButton.isOn = isOn
        switchButton.onTintColor = .systemYellow
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
        switchButton.onTintColor = .systemYellow
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
        containerView.layer.shadowColor = UIColor.gray.cgColor    // systemGray
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowRadius = 4
        return containerView
    }()

//
//
    let containerView1: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6 // .systemGray6
        containerView.layer.cornerRadius = 18
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.gray.cgColor             // .systemGray
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
        stackView.spacing = 10 // Отступ между контейнерами
//        stackView.backgroundColor = .blue
        
        stackView.isLayoutMarginsRelativeArrangement = true
               stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // Отступы от границ stackView

        return stackView
    }()
    
    let stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 15
        stackView.spacing = 5 // Отступ между контейнерами
//                stackView.backgroundColor = .purple
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.clipsToBounds = true
        
        // Добавляем контейнеры в stackView
        stackView.addArrangedSubview(containerView)
        stackView.addArrangedSubview(containerView1)
        
//        stackView1.addArrangedSubview(buttonCloseUIView)
//        stackView1.addArrangedSubview(containerView1)
//        stackView1.addArrangedSubview(containerView)
        
//        stackView2.addArrangedSubview(buttonCloseUIView2)
//        stackView2.addArrangedSubview(buttonCloseUIView3)
        
        
        // Добавляем stackView в contentView
        contentView.addSubview(stackView)
//        contentView.addSubview(stackView1)
        contentView.addSubview(stackView2)
        
        containerView.addSubview(switchButton)
        containerView.addSubview(welcomeImageView)
        containerView.addSubview(messageLabel)
        
        
        containerView1.addSubview(switchButton1)
        containerView1.addSubview(welcomeImageView1)
        containerView1.addSubview(messageLabel1)
        
        
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        containerView.clipsToBounds = true
        
        containerView1.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        containerView1.clipsToBounds = true
        
        
        layout()
        
        let switchState = UserDefaults.standard.bool(forKey: "switchState")
        switchButton.isOn = switchState
        switchButton.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        
        let switchState1 = UserDefaults.standard.bool(forKey: "switchState1")
        switchButton1.isOn = switchState1
        switchButton1.addTarget(self, action: #selector(switchValueChanged1), for: .valueChanged)
        
        
//        buttonCloseUIView.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
//        buttonCloseUIView1.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {
        
        // Размещение stackView в contentView
//        stackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview().inset(5) // Добавляем отступы от краев
//            make.height.equalTo(40) // Высота stackView
//        }
//
//        stackView1.snp.makeConstraints { make in
////            make.top.equalTo(stackView.snp.top).offset(10)
//            make.edges.equalToSuperview().inset(5) // Добавляем отступы от краев
//            make.height.equalTo(40) // Высота stackView
//        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(1)
//              make.top.equalToSuperview().inset(1) // Отступ сверху
//              make.leading.trailing.equalToSuperview().inset(50) // Горизонтальные отступы
//            make.trailing.equalToSuperview().inset(175)
              make.height.equalTo(100)// Высота stackView
//            make.width.equalToSuperview().inset(90)
          }
          
          // Размещение stackView1 под stackView
//          stackView1.snp.makeConstraints { make in
//              make.top.equalTo(stackView.snp.bottom).offset(-10) // Отступ сверху от stackView
////              make.leading.trailing.equalToSuperview().inset(1) // Горизонтальные отступы
//              make.leading.trailing.equalToSuperview().inset(10)
//              make.height.equalTo(70) // Высота stackView1
//              make.bottom.equalToSuperview().inset(1) // Отступ снизу
////              make.width.equalToSuperview().inset(90)
//          }
        
//        stackView2.snp.makeConstraints { make in
//            make.top.equalTo(stackView1.snp.bottom).offset(5) // Отступ сверху от stackView
//            make.leading.trailing.equalToSuperview().inset(5) // Горизонтальные отступы
//            make.height.equalTo(40) // Высота stackView1
//            make.bottom.equalToSuperview().inset(5) // Отступ снизу
//        }
                
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
