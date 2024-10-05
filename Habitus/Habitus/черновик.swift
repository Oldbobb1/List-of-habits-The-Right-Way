//MARK: - Color

//private let weekDaysButtons: [UIButton] = {
//    let days = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"]
//    let colors: [UIColor] = [.systemBlue, .systemGreen, .systemRed, .systemOrange, .systemPurple, .systemPink, .systemTeal]
//    return days.enumerated().map { index, day in
//        let button = UIButton()
//        button.setTitle(day, for: .normal)
//        button.backgroundColor = colors[index]
//        button.setTitleColor(.white, for: .normal)
//        button.layer.cornerRadius = 20
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOpacity = 0.3
//        button.layer.shadowRadius = 4
//        button.layer.shadowOffset = CGSize(width: 1, height: 2)
//        return button
//    }
//}()
//let buttonSpacing: CGFloat = 15
//let buttonSize: CGFloat = 50
//var lastButton: UIButton? = nil
//for button in weekDaysButtons {
//    button.snp.makeConstraints { make in
//        make.width.height.equalTo(buttonSize)
//        if let last = lastButton {
//            make.left.equalTo(last.snp.right).offset(buttonSpacing)
//        } else {
//            make.left.equalTo(view).offset(10)
//        }
//        make.top.equalTo(nightModeView.snp.bottom).offset(30)
//    }
//    lastButton = button
//}


//private func animateViews() {
//    customTextField.alpha = 0
//    datePicker.alpha = 0
//    colorButton.alpha = 0
//    customSwitch.alpha = 0
//
//
//    UIView.animate(withDuration: 1.0) {
//        self.customTextField.alpha = 1
//    } completion: { _ in
//        UIView.animate(withDuration: 1.0) {
//            self.datePicker.alpha = 1
//        } completion: { _ in
//            UIView.animate(withDuration: 1.0) {
//                self.colorButton.alpha = 1
//            } completion: { _ in
//                UIView.animate(withDuration: 1.0) {
//                    self.customSwitch.alpha = 1
//                }
//            }
//        }
//    }
//}

//   4 - на заметку
//        private let gradientLayer: CAGradientLayer = {
//            let gradient = CAGradientLayer()
//            gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemBlue.cgColor]
//            gradient.startPoint = CGPoint(x: 0, y: 0)
//            gradient.endPoint = CGPoint(x: 1, y: 1)
//            return gradient
//        }()

//  5
//    private let gradientLayer: CAGradientLayer = {
//        let gradient = CAGradientLayer()
//        gradient.colors = [UIColor.systemTeal.cgColor, UIColor.systemBlue.cgColor]
//        gradient.startPoint = CGPoint(x: 0, y: 0)
//        gradient.endPoint = CGPoint(x: 1, y: 1)
//
//        return gradient
//    }()

// 6 - для контроллера
//private let gradientLayer: CAGradientLayer = {
//        let gradient = CAGradientLayer()
//        gradient.colors = [
//            UIColor.systemMint.withAlphaComponent(0.8).cgColor,
//            UIColor.systemGray.withAlphaComponent(0.8).cgColor
//        ]
//        gradient.startPoint = CGPoint(x: 0, y: 0)
//        gradient.endPoint = CGPoint(x: 1, y: 1)
//        return gradient
//    }()
