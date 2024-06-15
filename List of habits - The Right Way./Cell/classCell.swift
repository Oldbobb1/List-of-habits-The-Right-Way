//
//  classCell.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi on 6.06.24.
//

import UIKit

//class NewLocation: UITableViewCell {
//        
//    private lazy var stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .horizontal
//        stackView.alignment = .fill
////        stackView.spacing = 16
////        stackView.addArrangedSubview(nameLabel)
//        return stackView
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//           super.init(style: style, reuseIdentifier: reuseIdentifier)
//           contentView.addSubview(stackView)
//           setupConstraints()
//       
//
//       }
//       
//       required init?(coder: NSCoder) {
//           fatalError("init(coder:) has not been implemented")
//       }
//       
//       func configure(_ viewModel: NewsWithLocationModel) {
////           nameLabel.text = viewModel.name
//         
//       }
//       
//       private func setupConstraints() {
//
//           let padding: CGFloat = 40
//         
//
//           
//           let constraints = [
//               stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
//               stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
//               stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
//               stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
//              
//                          ]
//       
//           NSLayoutConstraint.activate(constraints)
//        
//       }
//   
//    
//   }

class NewEmojiTableViewController: UITableViewController {
    
    var emoji = Emoji(emoji: "", name: "", description: "", isFavourite: false)
    
    var emojiTextField = UITextField()
   var nameTextField =  UITextField()
 var descriptionTextField = UITextField()
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        updateSaveButtonState()
    }
    
    private func updateSaveButtonState() {
        let emojiText = emojiTextField.text ?? ""
        let nameText = nameTextField.text ?? ""
        let descriptionText = descriptionTextField.text ?? ""
        
        saveButton.isEnabled = !emojiText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty
    }
    
    private func updateUI() {
        emojiTextField.text = emoji.emoji
        nameTextField.text = emoji.name
        descriptionTextField.text = emoji.description
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveSegue" else { return }
        
        let emoji = emojiTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let description = descriptionTextField.text ?? ""
        
        self.emoji = Emoji(emoji: emoji, name: name, description: description, isFavourite: self.emoji.isFavourite)
        
    }
}
