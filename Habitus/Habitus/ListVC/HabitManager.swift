//  HabitManager.swift

//  Habitus

//  Created by Bobbi R. on 7.07.24.

import UIKit

class HabitManager  {
    
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
