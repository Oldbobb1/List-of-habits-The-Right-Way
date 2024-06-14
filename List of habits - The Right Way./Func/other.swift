//
//  other.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi on 6.06.24.
//

import UIKit

//view.backgroundColor = UIColor(red: 240/255, green: 0/255, blue: 243/255, alpha: 1) -> настройка цвета


// в "репите" лист из дней недели и плюс скок раз в день повторяется

// в "мелодии" список из мелодий для будильника


// для нужного показа при смене темы нужны системные цвета 
//class someclass: UIViewController {
//    
//    // Переменные для хранения состояния заполненности полей
//    var isTextFieldFilled = false
//    var isDatePickerFilled = false
//    var isColorPickerFilled = false
//    
//    // Метод для проверки заполненности всех полей и активации/деактивации кнопки
//    func checkFieldsAndActivateButton() {
//        if isTextFieldFilled && isDatePickerFilled && isColorPickerFilled {
//            // Активация кнопки
//            yourButton.isEnabled = true
//        } else {
//            // Деактивация кнопки
//            yourButton.isEnabled = false
//        }
//    }
//    
//    // Метод, который будет вызываться при изменении текста в UITextField
//    @objc func textFieldDidChange(_ textField: UITextField) {
//        isTextFieldFilled = !textField.text.isEmpty
//        checkFieldsAndActivateButton()
//    }
//    
//    // Метод, который будет вызываться при изменении даты в UIDatePicker
//    @objc func datePickerValueChanged(_ sender: UIDatePicker) {
//        // Проверка, что выбрана непустая дата
//        isDatePickerFilled = true
//        checkFieldsAndActivateButton()
//    }
//    
//    // Метод, который будет вызываться при изменении цвета в UIColorPickerViewController
//    func colorPickerDidChange(_ color: UIColor) {
//        // Проверка, что выбран непустой цвет
//        isColorPickerFilled = true
//        checkFieldsAndActivateButton()
//    }
//}




//@objc func toggleTheme() {
//        if let currentTheme = UserDefaults.standard.string(forKey: "theme") {
//            if currentTheme == "light" {
//                // Сменить на темную тему
//                UserDefaults.standard.set("dark", forKey: "theme")
//            } else {
//                // Сменить на светлую тему
//                UserDefaults.standard.set("light", forKey: "theme")
//            }
//
//            // Обновить тему на текущем экране
//            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
//               let window = windowScene.windows.first {
//                window.overrideUserInterfaceStyle = currentTheme == "dark" ? .light : .dark
//            }
//
//            // Сохранить состояние переключателя после смены темы
//            UserDefaults.standard.set(switchButt.isOn, forKey: "switchState")
//            if let savedSwitchState = UserDefaults.standard.object(forKey: "switchState") as? Bool {
//                switchButt.isOn = savedSwitchState
//            }
//        }
//    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        self.navigationItem.setHidesBackButton(true, animated: false)
//    }
    


var selectedDate: Date? = Date() // Переменная для хранения выбранной даты, задана изначально текущей датой

//var date: UIDatePicker = {
//    let datePicker = UIDatePicker()
//    datePicker.datePickerMode = .time
//    datePicker.preferredDatePickerStyle = .wheels
//    datePicker.backgroundColor = UIColor.systemBackground
//
//    if let savedDate = UserDefaults.standard.object(forKey: "savedDate") as? Date {
//        selectedDate = savedDate
//    }
//    
//    datePicker.date = selectedDate ?? Date() // Установка выбранной даты
//    
//    return datePicker
//}()


//func createUserAccount(userIdentifier: String, userImage: UIImage, userName: String) {
//    self.userIdentifier = userIdentifier
//    
//    // Устанавливаем изображение и имя пользователя
//    userImageView.image = userImage
//    userNameLabel.text = userName
//    
//    // Показываем кнопку "Sign out" и скрываем кнопку "Sign in with Apple"
//    signInWithAppleButton.isHidden = true
////        signOutButton.isHidden = false
//}

// Метод обработки нажатия кнопки "Sign out"
//    @objc func signOut() {
//
//        userIdentifier = nil
//               userImageView.image = nil
//               userNameLabel.text = nil
//        signInWithAppleButton.isHidden = false
//               signOutButton.isHidden = true
//
//    }


//button.snp.makeConstraints { make in
//            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
//            make.leading.equalTo(view.snp.leading).offset(15)
//        }
