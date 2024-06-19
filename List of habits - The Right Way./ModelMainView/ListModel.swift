//
//  ListModel.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi R. on 19.06.24.
//

import UIKit

class ListModel {
    
    let label = Label.label(text: "List", fontSize: 25)
    let stackView = StackView.stack()
    let table = TableView.createNewTableView()
    let button = ButtonsWithAction.addButtonImage(systemName: "plus.circle", setImage: nil )
    
    var objects = [Emoji]()
    
    func updateUI(view: UIView) {
        
        view.addSubview(label); view.addSubview(stackView); view.addSubview(table); view.addSubview(button)
        self.table.addSubview(button)
        
        Layout.applyView(label, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0 )
        
        Layout.applyView(stackView, view: view , leadingOffset: 270, trailingOffset: 0,  additionalConstraints: {make in
            make.top.equalTo(self.label.snp.bottom).offset(0)
            make.height.equalTo(38)
        })
        
        Layout.applyView(table, view: view, leadingOffset: 10 , trailingOffset: -10, bottomOffset: 0, additionalConstraints:{ make in
            make.top.equalTo(self.stackView.snp.bottom).offset(5)
        })
        
        Layout.applyView(button, view: view, leadingOffset: 15 , bottomOffset: -10)
    }
    
    func updateCalendar() {
        
        let calendar = Calendar.current
        for i in -2..<1 {
            let day = calendar.date(byAdding: .day, value: i, to: Date())!
            dateCurrent(to: stackView, withDay: day)
            
        }
    }
    // Сохраняем массив данных о ячейках в UserDefaults
    func saveEmojiData() {
        let encodedData = try? JSONEncoder().encode(objects)
        UserDefaults.standard.set(encodedData, forKey: "SavedEmojis") // исправленный ключ
    }
    // Загружаем данные о ячейках из UserDefaults
    func loadEmojiData() {
        if let savedData = UserDefaults.standard.data(forKey: "SavedEmojis") { // исправленный ключ
            if let decodedData = try? JSONDecoder().decode([Emoji].self, from: savedData) {
                objects = decodedData
            }
        }
    }
}






