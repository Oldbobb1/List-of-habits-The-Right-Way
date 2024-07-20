import UIKit


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
