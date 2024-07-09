//  HabitVCTextFieldEctension.swift

//  Habitus

//  Created by Bobbi R. on 9.07.24.

import UIKit

extension HabitVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
