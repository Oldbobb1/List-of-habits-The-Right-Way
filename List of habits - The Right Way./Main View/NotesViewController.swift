//  NotesViewController.swift

//  List of habits - The Right Way.

//  Created by Bobbi on 6.06.24.

import UIKit

class NotesViewController: UIViewController {
   
    let label = Label.label(text: "Notes", fontSize: 25)
 
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
    }
    
    private func updateUI() {
        
        view.addSubview(label)

        Layout.applyView(label, view: view, topOffset: 0, leadingOffset: 0, trailingOffset: 0)
    }
    
}




//class NotesViewController: UIViewController {
//    
//    var emoji = Emoji(emoji: "", name: "", description: "", isFavourite: false)
//    
//    lazy var emojiTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Enter Emoji"
//        return textField
//    }()
//    
//    lazy var nameTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Enter Name"
//        return textField
//    }()
//    
//    lazy var descriptionTextField: UITextField = {
//        let textField = UITextField()
//        textField.placeholder = "Enter Description"
//        return textField
//    }()
//    
//     let saveButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Save", for: .normal)
//        return button
//    }()
//    
//    // MARK: - View Lifecycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setupUI()
//        updateSaveButtonState()
//        
//        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
//    }
//    
//    private func setupUI() {
//        view.addSubview(emojiTextField)
//        view.addSubview(nameTextField)
//        view.addSubview(descriptionTextField)
//        
//        emojiTextField.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
//            make.leading.equalTo(view.safeAreaLayoutGuide).offset(10)
//            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(-10)
//        }
//        
//        nameTextField.snp.makeConstraints { make in
//            make.top.equalTo(emojiTextField.snp.bottom).offset(16)
//            make.leading.trailing.equalTo(emojiTextField)
//        }
//        
//        descriptionTextField.snp.makeConstraints { make in
//            make.top.equalTo(nameTextField.snp.bottom).offset(16)
//            make.leading.trailing.equalTo(emojiTextField)
//        }
//        
//        Layout.applyView(saveButton, view: view, topOffset: 20, leadingOffset: 100, trailingOffset: -30)
//    }
//    
//    // MARK: - Button Actions
//    
//    @objc func saveButtonTapped() {
//            let emoji = emojiTextField.text ?? ""
//            let name = nameTextField.text ?? ""
//            let description = descriptionTextField.text ?? ""
//
//            self.emoji = Emoji(emoji: emoji, name: name, description: description, isFavourite: self.emoji.isFavourite)
//
//            // Perform any additional actions you need when the save button is tapped
//
//            // For example, you can dismiss the view controller after saving the emoji details
//            navigationController?.popViewController(animated: true)
//        }
//    
//    
//    // MARK: - Helper Methods
//    
//    private func updateSaveButtonState() {
//        let emojiText = emojiTextField.text ?? ""
//        let nameText = nameTextField.text ?? ""
//        let descriptionText = descriptionTextField.text ?? ""
//        
//        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty
//    }
//    
//}
