//
//  other.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi on 6.06.24.
//

import UIKit


//@objc func toggleTheme() {
//        if let currentTheme = UserDefaults.standard.string(forKey: "theme") {
//            if currentTheme == "light" {
//                // Сменить на темную тему
//                UserDefaults.standard.set("dark", forKey: "theme")
//            } else {
//                // Сменить на светлую тему
//                UserDefaults.standard.set("light", forKey: "theme")
//            }
//
//            // Обновить тему на текущем экране
//            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//               let window = windowScene.windows.first {
//                window.overrideUserInterfaceStyle = currentTheme == "dark" ? .light : .dark
//            }
//
//            // Сохранить состояние переключателя после смены темы
//            UserDefaults.standard.set(switchButt.isOn, forKey: "switchState")
//            if let savedSwitchState = UserDefaults.standard.object(forKey: "switchState") as? Bool {
//                switchButt.isOn = savedSwitchState
//            }
//        }
//    }

//func overrideUserInterfaceStyle(for traitCollection: UITraitCollection) -> UIUserInterfaceStyle {
//       if traitCollection.userInterfaceStyle == .dark {
//           // Темная тема
//           return .light
//       } else {
//           // Светлая тема
//           return .dark
//       }
//   }
