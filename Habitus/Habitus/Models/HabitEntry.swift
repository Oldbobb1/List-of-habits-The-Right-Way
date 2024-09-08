import UIKit

struct HabitEntry: Codable {
    
    var name: String
    var colorHex: String
    var isCompleted: Bool
//    var message: String
//    var buttonStates: [ButtonState]
    
    var color: UIColor {
        return UIColor(hexString: colorHex)
    }
    
    init(name: String, color: UIColor, isCompleted: Bool = false) {
        self.name = name
        self.colorHex = color.toHexString()
//        self.buttonStates = buttonStates
        self.isCompleted = isCompleted
//        self.message = message
    }
}


//struct ButtonState: Codable {
//    var isChecked: Bool
//}


extension UIColor {
    
    func toHexString() -> String {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        return String(format: "%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
    }
    
    convenience init(hexString: String) {
        let scanner = Scanner(string: hexString)
        scanner.currentIndex = hexString.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = CGFloat((rgbValue & 0xff0000) >> 16) / 255.0
        let g = CGFloat((rgbValue & 0xff00) >> 8) / 255.0
        let b = CGFloat(rgbValue & 0xff) / 255.0
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}



