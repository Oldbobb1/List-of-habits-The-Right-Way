import UIKit

extension SettingVC {
    
    func showAlert() {
        let alertController = UIAlertController(title: "Уведомление", message: "В разработке, появится позже", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }

}
