import UIKit
import ElementBuilder


class ListModel  {
    
    var habits: [HabitEntry] = []
       
    func saveHabitData() {
        let encodedData = try? JSONEncoder().encode(habits)
        UserDefaults.standard.set(encodedData, forKey: "SavedHabit")
    }
    
    func loadHabitData() {
        if let savedData = UserDefaults.standard.data(forKey: "SavedHabit") {
            if let decodedData = try? JSONDecoder().decode([HabitEntry ].self, from: savedData) {
                habits = decodedData
            }
        }
    }
    
}

