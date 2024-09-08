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

//class ListModel {
//    
//    var habits: [HabitEntry] = []
//    
//    // Сохранение данных привычек
//    func saveHabitData() {
//        do {
//            let encodedData = try JSONEncoder().encode(habits)
//            UserDefaults.standard.set(encodedData, forKey: "SavedHabit")
//        } catch {
//            print("Ошибка при сохранении привычек: \(error)")
//        }
//    }
//    
//    // Загрузка данных привычек
//    func loadHabitData() {
//        if let savedData = UserDefaults.standard.data(forKey: "SavedHabit") {
//            do {
//                let decodedData = try JSONDecoder().decode([HabitEntry].self, from: savedData)
//                habits = decodedData
//            } catch {
//                print("Ошибка при загрузке привычек: \(error)")
//            }
//        }
//    }
//}

