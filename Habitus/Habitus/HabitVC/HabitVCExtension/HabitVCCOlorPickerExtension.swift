//  HabitVCCOlorPickerExtension.swift

//  Habitus

//  Created by Bobbi R. on 9.07.24.

import UIKit

extension HabitVC: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        selectedColor = viewController.selectedColor
        updateHabitSaveButtonState()
    }
    
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let selectedColor = viewController.selectedColor
        habitView.selectedColorView.backgroundColor = selectedColor
    }
    
}
