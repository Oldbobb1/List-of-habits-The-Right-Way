import Foundation

//class LAunchSCreen: UIViewController {
//
//    // UIImageView для звезды
//    let starImageView: UIImageView = {
//        let imageView = UIImageView(image: UIImage(systemName: "star.circle.fill")) // Замените "star" на ваше изображение
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Устанавливаем фон и добавляем звезду на экран
//        view.backgroundColor = .white
//        view.addSubview(starImageView)
//
//        // Устанавливаем начальное расположение звезды по центру
//        starImageView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            starImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            starImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            starImageView.widthAnchor.constraint(equalToConstant: 300),  // Размер изображения
//            starImageView.heightAnchor.constraint(equalToConstant: 300)  // Размер изображения
//        ])
//
//        // Запускаем анимацию через 2 секунды
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            self.startStarAnimation()
//        }
//    }
//
//    // Анимация звезды (увеличение и вращение одновременно)
//    private func startStarAnimation() {
//        // Анимация увеличения
//        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
//        scaleAnimation.fromValue = 1.0
//        scaleAnimation.toValue = 5.0
//        scaleAnimation.duration = 2.0
//
//        // Анимация вращения
//        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
//        rotationAnimation.fromValue = 0
//        rotationAnimation.toValue = CGFloat.pi * 2
//        rotationAnimation.duration = 2.0
//        rotationAnimation.repeatCount = Float.infinity // Чтобы вращение продолжалось
//
//        // Анимационная группа, объединяющая увеличение и вращение
//        let animationGroup = CAAnimationGroup()
//        animationGroup.animations = [scaleAnimation, rotationAnimation]
//        animationGroup.duration = 2.0
//        animationGroup.fillMode = .forwards
//        animationGroup.isRemovedOnCompletion = false
//
//        // Добавляем анимацию к слою
//        starImageView.layer.add(animationGroup, forKey: "starAnimation")
//
//        // Запускаем перемещение звезды за пределы экрана после завершения анимации
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.transitionToMainScreen()
//        }
//    }
//
//    // Переход на главный экран приложения
//    private func transitionToMainScreen() {
//        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//           let window = windowScene.windows.first {
//
//            let mainViewController = ListVC() // Ваш основной ViewController
//            window.rootViewController = mainViewController
//            window.makeKeyAndVisible()
//
//            // Плавный переход
//            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
//        }
//    }
//}
