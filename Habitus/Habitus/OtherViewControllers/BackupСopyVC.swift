import SwiftUI
import UIKit
import ElementBuilder


class BackupСopyVC: UIViewController {

    let buttonCloseUIView = ButtonsWithAction.makeButton(cornerRadius: 17,setTitleColor: .label,clipsToBounds: false,backgroundColor: .clear,systemName:"x.circle", setImage: nil,imageSize: CGSize(width: 39, height: 38) ,alpha: 1,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 0),shadowOpacity: 0.6, shadowRadius: 3, tintColor: .label)
    
    let label = Label.label(text: "Backup Сopy", fontSize: 25, weight: .heavy, textColor: .label, textAlignment: .center, backgroundColor: .clear)
    
    let table = UITableView(frame: .zero, style: .insetGrouped)
    
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemCyan.withAlphaComponent(0.8).cgColor,
            UIColor.systemBlue.withAlphaComponent(0.9).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()
    
    private func setupGradientBackground() {
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }
    private let gradientLayer1: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [
            UIColor.systemCyan.withAlphaComponent(0.6).cgColor,
            UIColor.systemBlue.withAlphaComponent(0.7).cgColor
        ]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        return gradient
    }()
    
    
    private func setupGradientBackground1() {
        let backgroundView = UIView(frame: table.bounds)
        backgroundView.layer.insertSublayer(gradientLayer1, at: 0)
        
        table.backgroundView = backgroundView
    }
    
    // Обновление слоя при изменении размеров
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Обновляем frame градиентного слоя при изменении размеров таблицы
        gradientLayer1.frame = table.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .systemBackground
        
        setupGradientBackground1()
        setupGradientBackground()
        
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

        buttonCloseUIView.addAction(UIAction{[weak self] _ in
            guard let self = self else {return}
            self.dismiss(animated: true, completion: nil)
        }, for: .touchUpInside)
        
    }
    
}



struct ViewControllerProvider8: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            BackupСopyVC()
        }.edgesIgnoringSafeArea(.all)
    }
}


