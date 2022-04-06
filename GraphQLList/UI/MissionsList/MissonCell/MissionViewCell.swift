//
//  MissionViewCell.swift
//  GraphQLList
//
//  Created by Nikolay Dolgopolov on 04.04.2022.
//

import UIKit
import Apollo

class MissionViewCell: UITableViewCell {
    static let reuseIdentifier = "MissionViewCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var yearLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(yearLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: yearLabel.topAnchor, constant: 20).isActive = true
        
        yearLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 20).isActive = true
        yearLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true
        yearLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
    }
    
    func updateWith(_ model: MissionsListQuery.Data.Launch) {
        titleLabel.text = "Mission name: \(model.missionName ?? "N/A")"
        yearLabel.text = "Year: \(model.launchYear ?? "N/A")"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
