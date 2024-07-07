//
//  element.swift
//  Habitus
//
//  Created by Bobbi R. on 7.07.24.
//

import UIKit
import SnapKit


class ThemeManager {
    static var currentTheme: String {
        get {
            return UserDefaults.standard.string(forKey: "theme") ?? "system"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "theme")
        }
    }

    static func setTheme(theme: String) {
        if theme == "system" {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let window = windowScene.windows.first {
                    if window.traitCollection.userInterfaceStyle == .dark {
                        window.overrideUserInterfaceStyle = .dark
                        currentTheme = "dark"
                    } else {
                        window.overrideUserInterfaceStyle = .light
                        currentTheme = "light"
                    }
                }
            }
        } else if theme == "dark" {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let window = windowScene.windows.first {
                    window.overrideUserInterfaceStyle = .dark
                    currentTheme = "dark"
                }
            }
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let window = windowScene.windows.first {
                    window.overrideUserInterfaceStyle = .light
                    currentTheme = "light"
                }
            }
        }
    }

    static func observeSystemThemeChanges() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            NotificationCenter.default.addObserver(forName: UIWindow.didBecomeKeyNotification, object: windowScene, queue: nil) { notification in
                self.setTheme(theme: "system")
            }
        }
    }
}



public class SwipeClass {

    typealias SwipeAction = () -> Void

    weak var viewController: UIViewController?
    private var leftAction: SwipeAction?, rightAction: SwipeAction?

    init(viewController:UIViewController,leftAction: @escaping SwipeAction ,rightAction: @escaping SwipeAction ) {
        self.viewController = viewController
        self.leftAction = leftAction
        self.rightAction = rightAction
        setupSwipe()
    }

    private func setupSwipe() {
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft))
        swipeLeft.direction = .left
        viewController?.view.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight))
        swipeRight.direction = .right
        viewController?.view.addGestureRecognizer(swipeRight)
    }

    @objc private func swipeLeft() {
        leftAction?()
    }

    @objc private func swipeRight() {
        rightAction?()
    }
}


struct Layout  {

    static func applyView(_ element: UIView, view: UIView, topOffset: CGFloat? = nil, leadingOffset: CGFloat? = nil, trailingOffset: CGFloat? = nil, bottomOffset: CGFloat? = nil, additionalConstraints: ((ConstraintMaker) -> Void)...) {

        element.snp.makeConstraints { make in
            if let topOffset = topOffset {
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(topOffset)
            }
            if let leadingOffset = leadingOffset {
                make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(leadingOffset)
            }
            if let trailingOffset = trailingOffset {
                make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(trailingOffset)
            }
            if let bottomOffset = bottomOffset {
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(bottomOffset)
            }
            for constraint in additionalConstraints {
                constraint(make)
            }
        }
    }
}




public class ButtonsWithAction {

//    public static  func createButtonWithdAction(setTitle: String, cornerRadius: CGFloat?) -> UIButton {
//        let but = UIButton(type: .system)
//        but.setTitle(setTitle, for: .normal)
//        but.setTitleColor(.label, for: .normal)
//        but.layer.cornerRadius = cornerRadius ?? 0
//        but.titleLabel?.font = UIFont.systemFont(ofSize: 15)
//        return but
//    }
    
    public static  func createButtonWithdAction(setTitle: String, cornerRadius: CGFloat?, content: UIControl.ContentHorizontalAlignment ) -> UIButton {
        let but = UIButton(type: .system)
        but.setTitle(setTitle, for: .normal)
        but.setTitleColor(.label, for: .normal)
        but.layer.cornerRadius = cornerRadius ?? 0
        but.contentHorizontalAlignment = content
        but.clipsToBounds = true
        but.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        return but
    }

    public static  func addButtonWithAction(setTitle: String) -> UIButton {
        let but = UIButton(type: .system)
        but.setTitle(setTitle, for: .normal)
        but.setTitleColor(.label, for: .normal)
        but.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        but.configuration = .plain()
        return but
    }


    // MARK: - функция с установкой размеров для изображения.

    public static func createButtonWithSystemImage(systemName: String, setImage: UIImage?) -> UIButton {
        let button = UIButton(type: .system)
        let image = setImage ?? UIImage(systemName: systemName)
        let newSize = CGSize(width: 65, height: 60)
        UIGraphicsBeginImageContext(newSize)
        image?.draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        button.setImage(newImage, for: .normal)
        button.alpha = 0.5
        button.layer.cornerRadius = 360
        return button
    }

    public static func createSwitchButton(isOn: Bool) -> UISwitch {
        let switchButton = UISwitch()
        switchButton.isOn = isOn
        return switchButton
    }
}


public class Label {
    public  static func label(text: String, fontSize: CGFloat, weight: UIFont.Weight, textColor: UIColor?) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight )
        label.numberOfLines = 0
        return label
    }
}

public class TextField {
//height: CGFloat
    public static func textField(placeholder: String ) -> UITextField {
        let text = UITextField()
        text.placeholder = placeholder
        text.attributedPlaceholder = NSAttributedString(string: placeholder,attributes: [NSAttributedString.Key.foregroundColor: UIColor.label] )
        text.borderStyle = .roundedRect
        text.autocorrectionType = .yes
        text.layer.cornerRadius = 10
        text.font = UIFont.systemFont(ofSize: 15)
//        text.heightAnchor.constraint(equalToConstant: height).isActive = true
        return text
    }
}


public class StackView {
    public  static func stack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}

public class Image {
    public  static  func image (_ named: String,cornerRadius: CGFloat, contentMode: UIView.ContentMode ) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named:named)
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = cornerRadius
        imageView.contentMode = contentMode
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
}


public class TableView {
    public  static func tableView(frame: CGRect?, style: UITableView.Style?, backgroundColor: UIColor? ) -> UITableView {
        let tableView = UITableView(frame: frame ?? .null, style: style ?? .plain )
        tableView.backgroundColor = backgroundColor
        tableView.showsVerticalScrollIndicator = false
        tableView.clipsToBounds = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }
}

func dateCurrent(to stackView: UIStackView, withDay day: Date) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EE"
    let calendar = Calendar.current
    let dayOfWeek = dateFormatter.string(from: day)
    let dayOfMonth = calendar.component(.day, from: day)
    let dayOfWeekLabel = UILabel()
    dayOfWeekLabel.text = "\(dayOfWeek)\n  \(dayOfMonth)"
    dayOfWeekLabel.numberOfLines = 0
    dayOfWeekLabel.font = UIFont.systemFont(ofSize: 13)
    
    stackView.addArrangedSubview(dayOfWeekLabel)
}

//MARK: - использование в модели или непоследственно в классе (в классе вызов во viewDidload).

//func calendar() {
//    let calendar = Calendar.current
//
//    for i in 0..<3 {
//        let date = calendar.date(byAdding: .day, value: i, to: Date())!
//        dateCurrent(to: stackView, withDay: day)
//    }
//}

class DaysModel {
    
    let days = ["All","Mon","Tue","Wed","thur", "Fri","Sat", "Sun"]
    var selectedDays = [Int]()
    
    func setupDaysOfWeek(_ view: UIView) {
        for (index, day) in days.enumerated() {
//            let dayButton = UIButton()
            let dayButton = ButtonsWithAction.createButtonWithdAction(setTitle: day, cornerRadius: 10, content: .center)
//            dayButton.setTitle(day, for: .normal)
//            dayButton.setTitleColor(.label, for: .normal)
//            dayButton.contentHorizontalAlignment = .center // Выравнивание текста по центру
//            dayButton.layer.cornerRadius = 10
//            dayButton.clipsToBounds = true
            view.addSubview(dayButton)
            

            Layout.applyView(dayButton, view: view,topOffset: 1, leadingOffset: (CGFloat(0.5) + CGFloat(index * 45)),bottomOffset: -1 ,additionalConstraints: { make in
                make.width.equalTo(37)
            })
            
//            dayButton.snp.makeConstraints { make in
//                make.top.equalTo(view.snp.top).offset(1)
//                make.bottom.equalTo(view.snp.bottom).offset(-1)
//                make.leading.equalTo(view.snp.leading).offset(Int(0.5) + index * 45)
//                make.width.equalTo(37)
//            }
            
            dayButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
        }
    }
    
    @objc func dayButtonTapped(sender: UIButton) {
        guard let index = days.firstIndex(of: sender.titleLabel?.text ?? "") else { return }
        if index == 0 {
            if selectedDays.count == days.count - 1 {
                selectedDays.removeAll() // Сбросить выбор
            } else {
                selectedDays = Array(1..<days.count)
            }
        } else {
            if selectedDays.contains(index) {
                selectedDays.removeAll(where: { $0 == index })
            } else {
                selectedDays.append(index)
            }
        }
        for (index, day) in days.enumerated() {
            guard let button = sender.superview?.subviews.compactMap({ $0 as? UIButton }).first(where: { $0.titleLabel?.text == day }) else { continue }
            if selectedDays.contains(index) {
                button.backgroundColor = .systemBlue
            } else {
                button.backgroundColor = .clear
            }
        }
    }
}
