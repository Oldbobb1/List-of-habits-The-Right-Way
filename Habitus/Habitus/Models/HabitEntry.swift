import UIKit

struct HabitEntry: Codable {
    
    var name: String
    var colorHex: String
    var isCompleted: Bool
    var reminderTime: Date? // Store the selected time for the reminder
    
    var color: UIColor {
        return UIColor(hexString: colorHex)
    }
    
    init(name: String, color: UIColor, reminderTime: Date?, isCompleted: Bool = false){ 
        self.name = name
        self.colorHex = color.toHexString()
        self.reminderTime = reminderTime
        self.isCompleted = isCompleted
    }
}

