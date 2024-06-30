//  HabbitModel.swift

//  List of habits - The Right Way.

//  Created by Bobbi R. on 19.06.24.

import UIKit

class HabbitModel {
    var name: String?
    var time: Date?
    var color: UIColor?
    var isRepeated: Bool
    
    init(name: String?, time: Date?, color: UIColor?, isRepeated: Bool) {
        self.name = name
        self.time = time
        self.color = color
        self.isRepeated = isRepeated
    }
}







