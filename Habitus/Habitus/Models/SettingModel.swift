import UIKit


class SettingModel {
    
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                // Разрешение получено, можно сохранить это состояние
                DispatchQueue.main.async {
                    UserDefaults.standard.set(true, forKey: "notificationsEnabled")
                    UIApplication.shared.registerForRemoteNotifications()
                }
            } else {
                // Разрешение не получено
                DispatchQueue.main.async {
                    UserDefaults.standard.set(false, forKey: "notificationsEnabled")
                }
            }
        }
    }
}
//import UserNotifications
//
//class SettingModel {
//    func requestNotificationAuthorization(completion: @escaping (Bool) -> Void) {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//            DispatchQueue.main.async {
//                completion(granted)
//            }
//        }
//    }
//}
