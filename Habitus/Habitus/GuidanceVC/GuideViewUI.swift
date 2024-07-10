//  GuideViewUI.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import UIKit

class GuideViewUI {
    
    let skipButtonPress = ButtonsWithAction.createButtonWithdAction(setTitle: "пропустить", cornerRadius: 10, content: .center)
    
    var pageControl: UIPageControl!

    var imageNames  = [
        ("AppIcon", ImageShape.circle),
        ("guidePrew2", ImageShape.square),
        ("guidePrew3", ImageShape.square),
        ("guidePrew4", ImageShape.square),
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
        
        Layout.applyView(skipButtonPress, view: view, leadingOffset: 130, trailingOffset: -130, bottomOffset: -20)
        Layout.applyView(pageControl, view: view,leadingOffset: 10,trailingOffset: -10 , bottomOffset: -60)

    }
    
}