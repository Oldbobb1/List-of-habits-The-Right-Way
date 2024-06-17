//  Theme.swift

//  List of habits - The Right Way.

// Created by Bobbi on 14.06.24.

import UIKit

class ThemeManager {
    static func setTheme(theme: String) {
        let savedTheme = UserDefaults.standard.string(forKey: "theme") ?? "light"
        if savedTheme == "dark" {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let window = windowScene.windows.first {
                    window.overrideUserInterfaceStyle = .dark
                }
            }
        } else {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                if let window = windowScene.windows.first {
                    window.overrideUserInterfaceStyle = .light
                }
            }
        }
    }
}

