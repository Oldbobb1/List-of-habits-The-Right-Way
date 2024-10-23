import UIKit


extension UIColor {
    
    func toHexString() -> String {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let alphaInt = Int(a * 255)
        return String(format: "%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255), alphaInt) // Int(a * 255))
    }
    
    convenience init(hexString: String) {
        let scanner = Scanner(string: hexString)
        scanner.currentIndex = hexString.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = CGFloat((rgbValue & 0xff0000) >> 16) / 255.0
        let g = CGFloat((rgbValue & 0xff00) >> 8) / 255.0
        let b = CGFloat(rgbValue & 0xff) / 255.0
//        _ = CGFloat(rgbValue & 0xff000000) / 255.0
        let a = CGFloat((rgbValue & 0xff000000) >> 24) / 255.0 // Альфа-канал извлекается из первых двух символов
        self.init(red: r, green: g, blue: b, alpha: a)
    }
  
}
