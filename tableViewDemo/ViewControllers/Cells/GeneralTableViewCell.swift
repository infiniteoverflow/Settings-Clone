//
//  GeneralCollectionViewCell.swift
//  tableViewDemo
//
//  Created by Aswin Gopinathan on 20/04/24.
//

import UIKit

class GeneralTableViewCell: UITableViewCell {
    private lazy var tableView = UITableView()
    
    static let parentIdentifier = String(describing: GeneralTableViewCell.self)
    private let cellIdentifier = String(describing: GeneralTableViewCell.self)
    private var data: [SettingsModel] = []
    
    func setup(data: [SettingsModel]) {
        self.data = data
        
        setupTableView()
    }
    
    private func setupTableView() {
        tableView
            .add(to: contentView)
            .enableAutoLayout()
            .pinAllSides(to: contentView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 16
        
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

extension GeneralTableViewCell: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SettingTableViewCell else {
            return UITableViewCell()
        }
        cell.hidesBottomSeparator = indexPath.row == data.count - 1
        let dataModel = data[indexPath.row]
        cell.textLabel?.text = dataModel.text
        if dataModel.switchShown == true {
            let uiSwitch = UISwitch()
            uiSwitch.isOn = false
            cell.accessoryView = uiSwitch
        } else {
            cell.accessoryType = .disclosureIndicator
        }
        
        if let image = dataModel.image {
            cell.imageView?.image = UIImage(systemName: image)?.withRenderingMode(.alwaysOriginal)
            
            if let color = dataModel.imageTintColor {
                cell.imageView?.image = cell.imageView?.image?.withTintColor(color)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
}
