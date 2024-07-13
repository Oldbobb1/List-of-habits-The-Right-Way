//  CustomNavigationController.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import UIKit

class CustomNavigationController: UINavigationController {
    
    var customBottomMenu: CustomBottomMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomMenu()
        view.backgroundColor = .systemBackground
        showInitialViewController()
        
        navigationBar.isHidden = true
        
    }
    
    private func setupBottomMenu() {
        customBottomMenu = CustomBottomMenu()
        customBottomMenu.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customBottomMenu)
        
        Layout.applyView(customBottomMenu, view: view, leadingOffset: 10, trailingOffset: -10, bottomOffset: 10,  additionalConstraints: {make in
            make.height.equalTo(60)
        })
        
        // Add target actions for buttons
        customBottomMenu.homeButton.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
        customBottomMenu.cartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        customBottomMenu.favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
    }
    
    private func showInitialViewController() {
        let initialVC = ListVC()
//                initialVC.view.backgroundColor = .green
        self.setViewControllers([initialVC], animated: false)
    }
    
    @objc func homeButtonTapped(_ sender: UIButton) {
        let homeVC = ListVC()
//                homeVC.view.backgroundColor = .blue
        self.setViewControllers([homeVC], animated: false)
        animateButton(sender)
    }
    
    @objc func cartButtonTapped(_ sender: UIButton) {
        let cartVC = NotesVC()
//                cartVC.view.backgroundColor = .red
        self.setViewControllers([cartVC], animated: false)
        animateButton(sender)
    }
    
    @objc func favoriteButtonTapped(_ sender: UIButton) {
        let favoriteVC = SettingVC()
        //        favoriteVC.view.backgroundColor = .white
        self.setViewControllers([favoriteVC], animated: false)
        animateButton(sender)
    }
    private func animateButton(_ button: UIButton) {
          UIView.animate(withDuration: 0.1,
                         animations: {
              button.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
          },
                         completion: { _ in
              UIView.animate(withDuration: 0.1) {
                  button.transform = CGAffineTransform(rotationAngle: 2 * CGFloat.pi)
              }
          })
      }
}
