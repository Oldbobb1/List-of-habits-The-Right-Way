import SwiftUI
import UIKit
import ElementBuilder


class BackupСopyVC: UIViewController {

    let buttonCloseUIView = ButtonsWithAction.makeButton(cornerRadius: 17,setTitleColor: .label,clipsToBounds: false,backgroundColor: .clear,systemName:"x.circle", setImage: nil,imageSize: CGSize(width: 39, height: 38) ,alpha: 1,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.4, shadowRadius: 4, tintColor: .label)
    
    let label = Label.label(text: "Backup Сopy", fontSize: 25, weight: .heavy, textColor: .label, textAlignment: .center, backgroundColor: .clear)
    
    let table = UITableView(frame: .zero, style: .insetGrouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .systemCyan
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(label)
        view.addSubview(table)
        
        table.dataSource = self
        table.delegate = self
        
        table.layer.cornerRadius = 25
        table.showsVerticalScrollIndicator = false

        
        table.register(BackupCell.self, forCellReuseIdentifier: "Cell")
        table.register(BackupCell1.self, forCellReuseIdentifier: "Cell1")
        
        Layout.applyView(label, view: view, topOffset: 4, leadingOffset: 0, trailingOffset: 0)
        
        view.addSubview(buttonCloseUIView)

        Layout.applyView(buttonCloseUIView, view: view, topOffset: 0, leadingOffset: 10, additionalConstraints: {make in
            //            make.width.equalTo(100)
        })
        
        Layout.applyView(table, view: view,leadingOffset: 0 , trailingOffset: 0, bottomOffset: 0, additionalConstraints:{ make in
                        make.top.equalTo(self.label.snp.bottom).offset(30)
            make.bottom.equalTo(0)
        })

        buttonCloseUIView.addTarget(self, action: #selector(close), for: .touchUpInside)
        
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
    
}

extension BackupСopyVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0,1:
            return 1
        default:
            return 0
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BackupCell
            cell.selectionStyle = .none
            cell.backgroundColor = .clear
            return cell
        case 1:
            let cell1 = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! BackupCell1
            cell1.selectionStyle = .none
            cell1.backgroundColor = .clear
//            cell1.view = self
            return cell1
            
        default:
            return UITableViewCell()
        }
    }
}
 
extension BackupСopyVC: UITableViewDelegate { }

class BackupCell: UITableViewCell {
    
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6
        containerView.layer.cornerRadius = 18
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowOpacity = 0.6
        containerView.layer.shadowRadius = 4
        return containerView
    }()
    
    
    let label1 = Label.label(text:"Здесь будет нужное описание", fontSize: 20, weight: .regular, textColor: .label, textAlignment: .center, backgroundColor: .clear)
    
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "arrow.clockwise.square.fill") // Замена на системное изображение для проверки
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let label2 = Label.label(text:"Последняя резервная копия: Нет", fontSize: 18, weight: .regular, textColor: .label, textAlignment: .center, backgroundColor: .clear)
    
    
    let stackView = StackView.stackView(axis: .vertical,distribution: .fillProportionally,backgroundColor: .clear, cornerRadius: 10, spacing: 20, layoutMargins: .init(top: 10, left: 10, bottom: 10, right: 10))

    let containerView1: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .systemGray6
        containerView.layer.cornerRadius = 18
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        containerView.layer.shadowOpacity = 0.6
        containerView.layer.shadowRadius = 4
        return containerView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)
        
        stackView.addArrangedSubview(containerView)
        containerView.addSubview(label1)
        containerView.addSubview(image)
        
      stackView.addArrangedSubview(containerView1)
        
        containerView1.addSubview(label2)
        
        layuot()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func layuot() {
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
            make.height.equalTo(350)
        }
        
        containerView.snp.makeConstraints { make in
            make.height.equalTo(100) // Устанавливаем высоту второго контейнера меньше чем у первого
        }
        
        containerView1.snp.makeConstraints { make in
            make.height.equalTo(50) // Устанавливаем высоту второго контейнера меньше чем у первого
        }
        label1.snp.makeConstraints { make in
            make.top.equalTo(self.image.snp.top).offset(100)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }

        image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.width.equalTo(70)
        }
        
        label2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.trailing.equalToSuperview().offset(-10)
        }
    }

}

class BackupCell1: UITableViewCell {
    
    let buttonCopy = ButtonsWithAction.makeButton(setTitle: "Создать сейчас", cornerRadius: 18, setTitleColor: .label, clipsToBounds: false, backgroundColor: .systemGray6, shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.2, shadowRadius: 4)
    
    let buttonCopy1 = ButtonsWithAction.makeButton(setTitle: "Создавать автоматически: Выкл.", cornerRadius: 15, setTitleColor: .label, clipsToBounds: false, backgroundColor: .systemGray6, shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 0.2, shadowRadius: 4)
    
    let stackView = StackView.stackView(axis: .vertical, distribution: .fillEqually, backgroundColor: .clear, cornerRadius: 18, spacing: 10, layoutMargins: .init(top: 15, left: 15, bottom: 15, right: 15))
    
    // Храним текущее выбранное значение
    var selectedOption: String = "Выкл."
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(buttonCopy)
        stackView.addArrangedSubview(buttonCopy1)
        
        layuot()
        
        // Добавляем действие на кнопку выбора подписки
        buttonCopy1.addTarget(self, action: #selector(showSubscriptionOptions), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layuot() {
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
            make.height.equalTo(140)
        }
    }
    
    @objc func showSubscriptionOptions() {
        let alertController = UIAlertController(title: "Выберите подписку", message: nil, preferredStyle: .actionSheet)
        
        let option1 = UIAlertAction(title: getTitleForOption("Ежедневно"), style: .default) { [weak self] _ in
            self?.updateButtonTitle(with: "Ежедневно")
        }
        
        let option2 = UIAlertAction(title: getTitleForOption("Еженедельно"), style: .default) { [weak self] _ in
            self?.updateButtonTitle(with: "Еженедельно")
        }
        
        let option3 = UIAlertAction(title: getTitleForOption("Ежемесячно"), style: .default) { [weak self] _ in
            self?.updateButtonTitle(with: "Ежемесячно")
        }
        
        let option4 = UIAlertAction(title: getTitleForOption("Выкл."), style: .default) { [weak self] _ in
            self?.updateButtonTitle(with: "Выкл.")
        }
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertController.addAction(option1)
        alertController.addAction(option2)
        alertController.addAction(option3)
        alertController.addAction(option4)
        alertController.addAction(cancelAction)
        
        if let viewController = self.window?.rootViewController {
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
    
    private func getTitleForOption(_ option: String) -> String {
        // Добавляем галочку к выбранному варианту
        return selectedOption == option ? "✓ \(option)" : option
    }
    
    private func updateButtonTitle(with option: String) {
        // Обновляем текст кнопки и текущее выбранное значение
        self.selectedOption = option
        self.buttonCopy1.setTitle("Создавать автоматически: \(option)", for: .normal)
    }
}

struct ViewControllerProvider8: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            BackupСopyVC()
        }.edgesIgnoringSafeArea(.all)
    }
}


