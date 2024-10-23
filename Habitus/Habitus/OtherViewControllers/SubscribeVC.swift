import SwiftUI
import UIKit
import SnapKit
import StoreKit
import ElementBuilder


class SubscribeVC: UIViewController {
    
    // Переменная для хранения выбранной подписки
    var selectedSubscription: String? {
        didSet {
            if let subscription = selectedSubscription {
                startTrialButton.setTitle("\(subscription)", for: .normal)
            } else {
                startTrialButton.setTitle("Start", for: .normal)
            }
        }
    }
    
    // Кнопка закрытия (остается вне скролла)
    let closeButton = ButtonsWithAction.makeButton(cornerRadius: 17, clipsToBounds: false, backgroundColor: .clear, systemName: "x.circle", setImage: nil, imageSize: CGSize(width: 39, height: 38), alpha: 1, shadowColor: UIColor.systemBlue.cgColor, shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 0.4, shadowRadius: 4, tintColor: .systemBlue)
    
    // Основной ScrollView для всего контента
    let mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    // Контент внутри основного ScrollView
    let mainContentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    // ScrollView для подписок
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView()
        return contentView
    }()
    
    let featuresLabel = ButtonsWithAction.makeButton(setTitle: "Premium Features", setTitleColor: .black, backgroundColor: .clear)
    
    let premiumFeatures: [String] = ["Unlimited habits", "Quit Habit", "Habit reminders", "Yearly chart", "Habit reports", "HRV Chart"]
    
    var isFeaturesExpanded = false // Track expanded/collapsed state
    var featureLabels: [UILabel] = []

    let startTrialButton = ButtonsWithAction.makeButton(setTitle: "Start", cornerRadius: 18, setTitleColor: .label,font: .boldSystemFont(ofSize: 20),backgroundColor: .red)

    let image = Image.image("Image 1", contentMode: .scaleAspectFill)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupLayout()
        setupSubscriptionOptions()
        
        startTrialButton.addAction(UIAction{[weak self] _ in
            guard let self = self else {return}
            self.startFreeTrial()
        }, for: .touchUpInside)
        
        closeButton.addAction(UIAction{[weak self] _ in
            guard let self = self else {return}
            self.dismiss(animated: true, completion: nil)
        }, for: .touchUpInside)
        
        featuresLabel.addAction(UIAction{[weak self] _ in
            guard let self = self else {return}
            self.isFeaturesExpanded.toggle()
            for featureView in featureLabels {
                featureView.isHidden = !isFeaturesExpanded
            }
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }, for: .touchUpInside)
    }
    
    func setupLayout() {
        // Добавляем кнопку закрытия вне скролла
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.leading.equalToSuperview().offset(10)
        }

        // Добавляем основной скролл на экран
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainContentView)
        
        // Layout для основного ScrollView
        mainScrollView.snp.makeConstraints { make in
            make.top.equalTo(closeButton.snp.bottom).offset(0) //Под кнопкой закрытия
            make.leading.trailing.bottom.equalToSuperview()
        }

        // Layout для mainContentView (контента внутри основного скролла)
        mainContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // Привязка к краям ScrollView
            make.width.equalTo(mainScrollView.snp.width) // Ширина контента равна ширине ScrollView
        }
        
        // Layout для изображения
        mainContentView.addSubview(image)
        Layout.applyView(image, view: mainContentView, topOffset: 0, leadingOffset: 10, trailingOffset: -10, additionalConstraints: { make in
            make.height.equalTo(410)
        })
        
        // Layout для Premium Features
        mainContentView.addSubview(featuresLabel)
        featuresLabel.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(-30)
            make.left.equalToSuperview().offset(20)
        }
        
        // Добавляем премиальные функции
        var previousFeatureView: UIView = featuresLabel
        for feature in premiumFeatures {
            let featureView = createFeatureLabel(with: feature)
            featureView.isHidden = false
            featureLabels.append(featureView)
            mainContentView.addSubview(featureView)
            featureView.snp.makeConstraints { make in
                make.top.equalTo(previousFeatureView.snp.bottom).offset(10)
                make.left.equalToSuperview().offset(20)
            }
            previousFeatureView = featureView
        }
        // Добавляем ScrollView с подписками в mainContentView
        mainContentView.addSubview(scrollView)
        scrollView.addSubview(contentView) // Важно добавить contentView в scrollView
        
        // Устанавливаем ScrollView подписок
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(previousFeatureView.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(110) // Высота подписок
        }
        
        // Устанавливаем contentView для подписок
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalToSuperview() // Контент должен иметь ту же высоту, что и scrollView
        }
        
        // Layout для кнопки "Start Free Trial"
        mainContentView.addSubview(startTrialButton)
        startTrialButton.snp.makeConstraints { make in
            make.top.equalTo(scrollView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().offset(-20) // Привязываем к нижней части mainContentView
        }
    }
    
    func setupSubscriptionOptions() {
        let subscriptionViews = [
            createSubscriptionView(title: "free", discountText: "50% OFF", price: "9,99 $", oldPrice: "19,98 $", isSelected: false),
            createSubscriptionView(title: "6 month", discountText: "7 Days Free", price: "3,49 $", oldPrice: "10$", isSelected: false),
            createSubscriptionView(title: "yearly", discountText: "7 Days Free", price: "3,49 $", oldPrice:  "10$", isSelected: false),
            createSubscriptionView(title: "forever", discountText: "7 Days Free", price: "3,49 $", oldPrice:  "10$", isSelected: false)
        ]
        var previousView: UIView?
        for subscriptionView in subscriptionViews {
            contentView.addSubview(subscriptionView)
            subscriptionView.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview() // Контролируем, чтобы подписки растягивались по вертикали
                make.width.equalTo(view.frame.width * 0.8) // Ширина подписки
                if let previous = previousView {
                    make.left.equalTo(previous.snp.right).offset(10) // Горизонтальное расстояние между подписками
                } else {
                    make.left.equalToSuperview().offset(20)
                }
            }
            previousView = subscriptionView
        }
     
        
        // Устанавливаем правый край contentView, чтобы все подписки были видны
        contentView.snp.makeConstraints { make in
            make.right.equalTo(previousView!.snp.right).offset(20) // Контент растягивается по ширине
        }
    }
    
    func createSubscriptionView(title: String, discountText: String?, price: String, oldPrice: String?, isSelected: Bool) -> UIView {
        let container = UIView()
        container.layer.cornerRadius = 18
        container.layer.borderWidth = 2
        container.layer.borderColor = UIColor.lightGray.cgColor
        container.backgroundColor = .systemBackground

        let titleLabel = Label.label(text: title,fontSize: 24, weight: .bold, backgroundColor: .clear)
        
        let discountLabel = Label.label(text: discountText,fontSize: 16, weight: .light, textAlignment: .center, backgroundColor: .yellow)
 
        let priceLabel = Label.label(text: price,fontSize: 22, weight: .regular, textColor: .red, backgroundColor: .clear)
    
        let oldPriceLabel = Label.label(text: oldPrice,fontSize: 18, weight: .regular, textColor: .gray, backgroundColor: .clear)
        
        oldPriceLabel.attributedText = NSAttributedString(string: oldPrice ?? "", attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, discountLabel, priceLabel, oldPriceLabel].compactMap { $0 })
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .center
        
        container.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        //MARK: - заменить 
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(subscriptionTapped(_:)))
        container.addGestureRecognizer(tapGesture)
        container.isUserInteractionEnabled = true
        container.tag = isSelected ? 1 : 0

               container.addSubview(titleLabel)
               container.addSubview(discountLabel)
               container.addSubview(priceLabel)
               container.addSubview(oldPriceLabel)
       
               container.snp.makeConstraints { make in
                   make.width.equalTo(220)
               }
        
               titleLabel.snp.makeConstraints { make in
                   make.top.equalToSuperview().offset(10)
                   make.leading.equalToSuperview().offset(20)
               }
       
               discountLabel.snp.makeConstraints { make in
                   make.centerY.equalTo(titleLabel)
                   make.leading.equalTo(titleLabel.snp.trailing).offset(10)
                   make.width.equalTo(90)
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
    
//    @objc func subscriptionTapped(_ sender: UITapGestureRecognizer) {
//        guard let view = sender.view else { return }
//        for subview in contentView.subviews {
//            subview.layer.borderColor = UIColor.lightGray.cgColor
//            subview.tag = 0
//        }
//        view.layer.borderColor = UIColor.systemBlue.cgColor
//        view.tag = 1
//        if let index = contentView.subviews.firstIndex(of: view) {
//            selectedSubscription = ["free", "6 month", "yearly", "forever"][index]
//        }
//    }
    
        @objc func subscriptionTapped(_ sender: UITapGestureRecognizer) {
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
    
     func startFreeTrial() {
        if let subscription = selectedSubscription {
            print("Start free trial for \(subscription)")
        } else {
            print("Please select a subscription")
        }
    }
   
    func createFeatureLabel(with text: String) -> UILabel {
        let label = Label.label(text: "• \(text)",fontSize: 16, weight: .regular, backgroundColor: .clear)
        label.isHidden = true
        return label
    }
}





struct ViewControllerProvider7: PreviewProvider {
    static var previews: some View {
        ViewControllersPreview {
            SubscribeVC()
        }.edgesIgnoringSafeArea(.all)
    }
}
