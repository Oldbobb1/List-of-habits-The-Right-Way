//  ListModel.swift

//  List of habits - The Right Way.

//  Created by Bobbi R. on 19.06.24.

import UIKit

class ListModel {
    
    var objects = [Emoji]()
    
    func saveEmojiData() {
        let encodedData = try? JSONEncoder().encode(objects)
        UserDefaults.standard.set(encodedData, forKey: "SavedEmojis")
    }
    
    func loadEmojiData() {
        if let savedData = UserDefaults.standard.data(forKey: "SavedEmojis") {
            if let decodedData = try? JSONDecoder().decode([Emoji].self, from: savedData) {
                objects = decodedData
            }
        }
    }
}





