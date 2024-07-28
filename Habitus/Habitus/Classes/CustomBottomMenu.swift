import UIKit
import ElementBuilder


class CustomButtomMenu: UIView {
    
    let stackView = StackView.stackView(axis: .horizontal,distribution: .fillEqually, backgroundColor: .clear )
    
    let openListVC = ButtonsWithAction.makeButton(cornerRadius: 15,clipsToBounds: false, backgroundColor: .systemGray6,systemName:"list.bullet.circle", setImage: nil,imageSize: CGSize(width: 38, height: 38) ,alpha: 1,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.4, shadowRadius: 4)
    
    let openNotesVC = ButtonsWithAction.makeButton(cornerRadius: 15,clipsToBounds: false, backgroundColor: .systemGray6,systemName:"pencil.circle", setImage: nil,imageSize: CGSize(width: 38, height: 38) ,alpha: 1,shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.4, shadowRadius: 4)
    
    let openSettingVC = ButtonsWithAction.makeButton( cornerRadius: 15,clipsToBounds: false,backgroundColor: .systemGray6,systemName: "gear", setImage: nil,imageSize: CGSize(width: 38, height: 38) ,alpha: 1, shadowColor: UIColor.black.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.4, shadowRadius: 4)
    
    private lazy var customBar: UIView = {
        let view = UIView()
//        view.backgroundColor = UIColor(red: 240/255, green: 248/255, blue: 255/255, alpha: 1.0)
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowOpacity = 0.6
        view.layer.shadowRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
        
    private func setupView() {
        
        addSubview(customBar)
        customBar.addSubview(stackView)
        
        addSubview(openListVC)
        addSubview(openNotesVC)
        addSubview(openSettingVC)
        addSubview(stackView)
        
        stackView.addArrangedSubview(openListVC)
        stackView.addArrangedSubview(openNotesVC)
        stackView.addArrangedSubview(openSettingVC)
        
        layout()
    }
    
    func layout() {
        customBar.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
            make.height.equalTo(60)
        }

        stackView.snp.makeConstraints { make in
            make.edges.equalTo(customBar).inset(7)
        }
    }
}



