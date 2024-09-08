import UIKit


extension HabitVC: UIColorPickerViewControllerDelegate {
    
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        selectedColor = viewController.selectedColor
        updateHabitSaveButtonState()
    }
    
//    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
//        let selectedColor = viewController.selectedColor
////        habitView.selectedColorView.backgroundColor = selectedColor
//
//    }
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        let selectedColor = viewController.selectedColor
        
        // Проверяем, есть ли сохраненный индекс
        if let indexPath = selectedIndexPath,
           let cell = habitView.createTableView.cellForRow(at: indexPath) as? TexеCell {
            // Обновляем backgroundColor для selectedColorView
            cell.selectedColorView.backgroundColor = selectedColor
        }
    }
    
   }

