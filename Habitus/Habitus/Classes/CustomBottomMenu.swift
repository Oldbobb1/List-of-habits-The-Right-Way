import UIKit
import ElementBuilder


class CustomButtomMenu: UIView {
    
    let stackView = StackView.stackView(axis: .horizontal,distribution: .fillEqually, backgroundColor: .clear, cornerRadius: 15 )
//38 - 38
    
    let openHabitVC = ButtonsWithAction.makeButton(cornerRadius: 20,clipsToBounds: false, backgroundColor: .systemGray6,systemName: "plus.circle", setImage: nil,imageSize: CGSize(width: 28, height: 28) ,alpha: 1,shadowColor: UIColor.gray.cgColor, shadowOffset: CGSize(width: 1, height: 2),shadowOpacity: 0.6, shadowRadius: 4)
    
    let openListVC = ButtonsWithAction.makeButton(cornerRadius: 20,clipsToBounds: false, backgroundColor: .systemGray6,systemName:"list.bullet.circle", setImage: nil,imageSize: CGSize(width: 28, height: 28) ,alpha: 1,shadowColor: UIColor.gray.cgColor, shadowOffset: CGSize(width: 1, height: 2),shadowOpacity: 0.6, shadowRadius: 4)
    
    let openNotesVC = ButtonsWithAction.makeButton(cornerRadius: 20,clipsToBounds: false, backgroundColor: .systemGray6,systemName:"pencil.circle", setImage: nil,imageSize: CGSize(width: 28, height: 28) ,alpha: 1,shadowColor: UIColor.gray.cgColor, shadowOffset: CGSize(width: 1, height: 2),shadowOpacity: 0.6, shadowRadius: 4)
    
    let openSettingVC = ButtonsWithAction.makeButton( cornerRadius: 20,clipsToBounds: false,backgroundColor: .systemGray6,systemName: "gear", setImage: nil,imageSize: CGSize(width:28, height: 28) ,alpha: 1, shadowColor: UIColor.gray.cgColor, shadowOffset: CGSize(width: 1, height: 2),shadowOpacity: 0.6, shadowRadius: 4)
    
    let openStatisticsVC = ButtonsWithAction.makeButton( cornerRadius: 20,clipsToBounds: false,backgroundColor: .systemGray6,systemName: "chart.line.uptrend.xyaxis.circle", setImage: nil,imageSize: CGSize(width:28,height:28) ,alpha: 1, shadowColor: UIColor.gray.cgColor, shadowOffset: CGSize(width: 1, height: 2),shadowOpacity: 0.6, shadowRadius: 4)
    
    private lazy var customBar: UIView = {
        let view = UIView()
//        view.backgroundColor = UIColor(red: 240/255, green: 248/255, blue: 255/255, alpha: 1.0)
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 25
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize(width: 1, height: 2)
        view.layer.shadowOpacity = 0.8
        view.layer.shadowRadius = 6
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
        stackView.spacing = 5
        
        openHabitVC.tintColor = .black
        openListVC.tintColor = .black
        openSettingVC.tintColor = .black
        openNotesVC.tintColor = .black
        openStatisticsVC.tintColor = .black
        
    
//        addSubview(openHabitVC)
//        addSubview(openListVC)
//        addSubview(openNotesVC)
//        addSubview(openSettingVC)
//        addSubview(openStatisticsVC)
        addSubview(stackView)
        
        stackView.addArrangedSubview(openHabitVC)
        stackView.addArrangedSubview(openListVC)
        stackView.addArrangedSubview(openNotesVC)
        stackView.addArrangedSubview(openStatisticsVC)
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




