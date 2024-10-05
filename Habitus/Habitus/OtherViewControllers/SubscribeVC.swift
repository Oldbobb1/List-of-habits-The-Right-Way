import SwiftUI
import UIKit
import SnapKit
import StoreKit
import ElementBuilder


import UIKit
import SnapKit

class SubscribeVC: UIViewController {
    
    // Переменная для хранения выбранной подписки
    var selectedSubscription: String? {
        didSet {
            // Обновляем текст кнопки, когда выбран новый вариант подписки
            if let subscription = selectedSubscription {
                startTrialButton.setTitle("Start \(subscription)", for: .normal)
            } else {
                startTrialButton.setTitle("Start", for: .normal)
            }
        }
    }
    
    let closeButton = ButtonsWithAction.makeButton(cornerRadius: 17,clipsToBounds: false,backgroundColor: .clear,systemName:"x.circle", setImage: nil,imageSize: CGSize(width: 39, height: 38) ,alpha: 1,shadowColor: UIColor.systemBlue.cgColor, shadowOffset: CGSize(width: 0, height: 2),shadowOpacity: 0.4, shadowRadius: 4, tintColor: .systemBlue)
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
//        scrollView.backgroundColor = .blue
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
//        contentView.backgroundColor = .red
        return contentView
    }()
    
    let featuresLabel: UILabel = {
        let label = UILabel()
        label.text = "Premium Features"
        label.font = .boldSystemFont(ofSize: 20)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    let premiumFeatures: [String] = ["Unlimited habits", "Quit Habit", "Habit reminders", "Yearly chart", "Habit reports", "HRV Chart"]
    
    var isFeaturesExpanded = false // Track expanded/collapsed state
       
       var featureLabels: [UILabel] = []

    // Кнопка "Start Free Trial"
    let startTrialButton: UIButton = {
        let button = UIButton()
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 18
        return button
    }()
    
   
     
    let image: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named:"Image 1")
        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(image)
        
        Layout.applyView(image, view: view, topOffset: 0, leadingOffset: 10, trailingOffset: -10,additionalConstraints: {make in
            make.height.equalTo(410)
        })
    
        setupLayout()
        setupSubscriptionOptions()
        setupGestureForFeaturesLabel()
        
        startTrialButton.addTarget(self, action: #selector(startFreeTrial), for: .touchUpInside)
        
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
       
    }
    
    @objc func close() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupLayout() {
        // Добавляем элементы на экран
        view.addSubview(closeButton)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        view.addSubview(featuresLabel)
        view.addSubview(startTrialButton)
        
    
        // Layout для кнопки закрытия
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.leading.equalToSuperview().offset(10)
//            make.width.height.equalTo(30)
        }
        
        // Layout для ScrollView с подписками
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(featuresLabel.snp.bottom).offset(200)
            make.left.right.equalToSuperview()
            make.height.equalTo(110)
        }
        
        // Контейнер для контента внутри ScrollView
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(110)
        }
        
        // Layout для Premium Features
        featuresLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(-30)
            make.left.equalToSuperview().offset(20)
        }
       
        // Добавляем кнопки для премиальных функций
        var previousFeatureView: UIView = featuresLabel
        for feature in premiumFeatures {
            let featureView = createFeatureLabel(with: feature)
            featureView.isHidden = false 
            featureLabels.append(featureView)
            view.addSubview(featureView)
            featureView.snp.makeConstraints { make in
                make.top.equalTo(previousFeatureView.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(20)
            }
            previousFeatureView = featureView
        }
       
        // Layout для кнопки "Start Free Trial"
        startTrialButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(50)
        }
    }
    
    func setupGestureForFeaturesLabel() {
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(togglePremiumFeatures))
           featuresLabel.addGestureRecognizer(tapGesture)
       }
       
       // MARK: - Toggle Premium Features
       @objc func togglePremiumFeatures() {
           isFeaturesExpanded.toggle() // Toggle expanded/collapsed state
           
           for featureView in featureLabels {
               featureView.isHidden = !isFeaturesExpanded // Show or hide features
           }
           
           // Animate layout changes
           UIView.animate(withDuration: 0.3) {
               self.view.layoutIfNeeded()
           }
       }
    
    func setupSubscriptionOptions() {
        let subscriptionViews = [
            createSubscriptionView(title: "free", discountText: "50% OFF", price: "9,99 $", oldPrice: "19,98 $", isSelected: false),
            createSubscriptionView(title: "6 month", discountText: "7 Days Free Trial", price: "3,49 $", oldPrice: nil, isSelected: false),
            createSubscriptionView(title: "  years", discountText: "7 Days Free Trial", price: "3,49 $", oldPrice: nil, isSelected: false),
            createSubscriptionView(title: "forever", discountText: "7 Days Free Trial", price: "3,49 $", oldPrice: nil, isSelected: false)
        ]
        
        var previousView: UIView?
        for subscriptionView in subscriptionViews {
            contentView.addSubview(subscriptionView)
            subscriptionView.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.width.equalTo(view.frame.width * 0.8) // Ширина одного варианта подписки
                if let previous = previousView {
                    make.left.equalTo(previous.snp.right).offset(20)
                } else {
                    make.left.equalToSuperview().offset(20)
                }
            }
            previousView = subscriptionView
        }
        
        // Обновляем ширину contentView на основе количества вариантов подписки
        contentView.snp.makeConstraints { make in
            make.right.equalTo(previousView!.snp.right).offset(20)
        }
        
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(subscriptionViews.count), height: 150)
    }
    
    func createSubscriptionView(title: String, discountText: String? , price: String, oldPrice: String?, isSelected: Bool) -> UIView {
        let container = UIView()
        container.layer.cornerRadius = 18
        container.layer.borderWidth = 2
        container.layer.borderColor = UIColor.lightGray.cgColor
        container.backgroundColor = .systemBackground
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .boldSystemFont(ofSize: 24)
        
        let discountLabel = UILabel()
        discountLabel.text = discountText
        discountLabel.font = .systemFont(ofSize: 14)
        discountLabel.textColor = .white
        discountLabel.backgroundColor = .systemBlue
        discountLabel.textAlignment = .center
        discountLabel.layer.cornerRadius = 10
        discountLabel.layer.masksToBounds = true
        
        let priceLabel = UILabel()
        priceLabel.text = price
        priceLabel.font = .boldSystemFont(ofSize: 28)
        priceLabel.textColor = .red
        
        let oldPriceLabel: UILabel = {
            let label = UILabel()
            if let oldPrice = oldPrice {
                let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: oldPrice)
                attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
                label.attributedText = attributeString
                label.font = .systemFont(ofSize: 16)
            }
            return label
        }()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectSubscription(_:)))
        container.addGestureRecognizer(tapGesture)
        container.isUserInteractionEnabled = true
        
        container.addSubview(titleLabel)
        container.addSubview(discountLabel)
        container.addSubview(priceLabel)
        container.addSubview(oldPriceLabel)
        
        container.snp.makeConstraints { make in
            make.width.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        discountLabel.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.leading.equalTo(titleLabel.snp.trailing).offset(15)
            make.width.equalTo(80)
            make.height.equalTo(24)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
        }
        
        oldPriceLabel.snp.makeConstraints { make in
            make.centerY.equalTo(priceLabel)
            make.left.equalTo(priceLabel.snp.right).offset(10)
        }
        
        return container
    }
    
    // Функция для создания лейблов с иконками для премиальных функций
    func createFeatureLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = "✓ \(text)"
        label.font = .systemFont(ofSize: 18)
        return label
    }
    
    @objc func startFreeTrial() {
        guard let selectedSubscription = selectedSubscription else {
            print("Please select a subscription option.")
            return
        }
        
        // Логика для начала пробного периода с выбранной подпиской
        print("Starting free trial for \(selectedSubscription)")
    }
    
    @objc func selectSubscription(_ sender: UITapGestureRecognizer) {
        if let selectedView = sender.view {
            // Сброс стилей всех подписок
            for subview in contentView.subviews {
                subview.layer.borderColor = UIColor.lightGray.cgColor
                subview.backgroundColor = .systemBackground
            }
            
            // Устанавливаем выбранный стиль
            selectedView.layer.borderColor = UIColor.systemRed.cgColor
            selectedView.backgroundColor = UIColor.systemRed.withAlphaComponent(0.1)
            
            // Обновляем выбранную подписку
            if let label = selectedView.subviews.compactMap({ $0 as? UILabel }).first {
                selectedSubscription = label.text
            }
        }
    }
}



struct ViewControllerProvider7: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            SubscribeVC()
        }.edgesIgnoringSafeArea(.all)
    }
}










