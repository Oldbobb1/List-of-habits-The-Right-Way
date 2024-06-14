//
//  classCell.swift
//  List of habits - The Right Way.
//
//  Created by Bobbi on 6.06.24.
//

import UIKit

class NewLocation: UITableViewCell {
        
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
//        stackView.spacing = 16
//        stackView.addArrangedSubview(nameLabel)
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           contentView.addSubview(stackView)
           setupConstraints()
       

       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       func configure(_ viewModel: NewsWithLocationModel) {
//           nameLabel.text = viewModel.name
         
       }
       
       private func setupConstraints() {

           let padding: CGFloat = 40
         

           
           let constraints = [
               stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
               stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
               stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
               stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
              
                          ]
       
           NSLayoutConstraint.activate(constraints)
        
       }
   
    
   }
