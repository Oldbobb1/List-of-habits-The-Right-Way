//  extension+HabbitView.swift

//  List of habits - The Right Way.

//  Created by Bobbi R. on 23.06.24.

import UIKit

extension HabbitViewController: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        //        // Обновляем цвет кнопки
        //        color.backgroundColor = viewController.selectedColor
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        //        let selectedColor = viewController.selectedColor
        // Обновляем цвет кружка выбранного цвета
        //        selectedColorView.backgroundColor = selectedColor
        
        let selectedColor = viewController.selectedColor
        //        saveSelectedColor(selectedColor)
        habbitView.selectedColorView.backgroundColor = selectedColor
        //        viewController.dismiss(animated: true, completion: nil)
    }
}


extension HabbitViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
