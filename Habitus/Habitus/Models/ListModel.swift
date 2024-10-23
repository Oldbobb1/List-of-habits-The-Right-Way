import UIKit
import ElementBuilder


class ListModel {
   
    var habits: [HabitEntry] = []
    
    func saveHabitData() {
        UserDefaults.standard.save(habits, forKey: "SavedHabit")
    }
    
    func loadHabitData() {
        habits = UserDefaults.standard.load(forKey: "SavedHabit", as: [HabitEntry].self) ?? []
    }
    
}







