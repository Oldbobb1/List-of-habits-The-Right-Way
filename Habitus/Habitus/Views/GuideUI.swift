import UIKit
import ElementBuilder


class GuideUI {
    
    let skipButtonPress = ButtonsWithAction.makeButton(setTitle: "пропустить", cornerRadius: 10, content: .center)
    
    var pageControl: UIPageControl!

    var imageNames  = [
        ("AppIcon", ImageShape.circle),
        ("Image1", ImageShape.square),
        ("Image2", ImageShape.square),
        ("Image2", ImageShape.square),
        ("guidePrew5", ImageShape.square)
    ]
    
    var texts = [
          """
TrackTide
Поможет вам завести и поддерживать полезные привычки, позволяя достичь долгосрочных целей.
""",
          "Добавьте привычку, выберите цвет и укажите, как часто вы хотите повторять привычку в определенный интервал",
          "Отметьте выполнение привычки в указанный день.Каждое повторение делает вашу привычку сильнее, а каждый пропуск - слабее.",
          "При помощи графиков вы легко можете посмотреть полную историю ваших привычек и то, как они закреплялись со",
          "конец"
      ]
    
    func initializeUI(_ view: UIView){
        
        pageControl = UIPageControl()
        pageControl.numberOfPages = imageNames.count
        pageControl.currentPage = 0
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = .black
        pageControl.currentPageIndicatorTintColor = .red
        
        view.addSubview(pageControl)
        view.addSubview(skipButtonPress)
        
        skipButtonPress.titleLabel?.textColor = .blue
        layout(view)
    }
    
    func layout(_ view: UIView) {
        
        Layout.applyView(skipButtonPress, view: view, leadingOffset: 130, trailingOffset: -130, bottomOffset: -20)
        
        Layout.applyView(pageControl, view: view,leadingOffset: 10,trailingOffset: -10 , bottomOffset: -60)
    }
}
