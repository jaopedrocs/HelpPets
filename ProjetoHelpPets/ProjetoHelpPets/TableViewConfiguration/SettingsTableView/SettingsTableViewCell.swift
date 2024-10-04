//
//  SettingsTableViewCell.swift
//  ProjetoFodaseDeSouza
//
//  Created by André Nestor on 17/09/24.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static let identifier: String = "SettingsTableViewCell"
    
    lazy var cellTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        cellConfiguration()
        itemOnCellConstraintConfiguration()
    }

    private func cellConfiguration() {
        self.addSubview(cellTitle)
        contentView.layer.cornerRadius = 15
    }
    
    private func itemOnCellConstraintConfiguration() {
        NSLayoutConstraint.activate([
            cellTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            cellTitle.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor)
        ])
    }

}
