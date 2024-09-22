import UIKit
import ElementBuilder


//class ListModel  {
//    
//    var habits: [HabitEntry] = []
//       
//    func saveHabitData() {
//        let encodedData = try? JSONEncoder().encode(habits)
//        UserDefaults.standard.set(encodedData, forKey: "SavedHabit")
//    }
//    
//    func loadHabitData() {
//        if let savedData = UserDefaults.standard.data(forKey: "SavedHabit") {
//            if let decodedData = try? JSONDecoder().decode([HabitEntry ].self, from: savedData) {
//                habits = decodedData
//            }
//        }
//    }
//}



extension UserDefaults {
    func save<T: Codable>(_ object: T, forKey key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            set(encoded, forKey: key)
        }
    }

    func load<T: Codable>(forKey key: String, as type: T.Type) -> T? {
        if let data = data(forKey: key) {
            let decoder = JSONDecoder()
            return try? decoder.decode(type, from: data)
        }
        return nil
    }
}

class ListModel {
    var habits: [HabitEntry] = []
    
    func saveHabitData() {
        UserDefaults.standard.save(habits, forKey: "SavedHabit")
    }
    
    func loadHabitData() {
        habits = UserDefaults.standard.load(forKey: "SavedHabit", as: [HabitEntry].self) ?? []
    }
}
