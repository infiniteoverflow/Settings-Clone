//
//  SettingsHomeViewController.swift
//  tableViewDemo
//
//  Created by Aswin Gopinathan on 20/04/24.
//

import UIKit

class SettingsHomeViewController: UIViewController {
    
    private lazy var tableView = UITableView()

    private let cellIdentifier = String(describing: UITableViewCell.self)
    private let backgroundColor = UIColor(red: 245/255, 
                                          green: 242/255,
                                          blue: 235/255,
                                          alpha: 1)
    
    private let settingsHomeViewModel = SettingsHomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = backgroundColor
        title = "Settings"
        
        setupTableView()
    }

    private func setupTableView() {
        tableView
            .add(to: view)
            .enableAutoLayout()
            .pinAllSides(to: view,
                         top: 0,
                         trailing: 16,
                         bottom: 0,
                         leading: 16)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.register(GeneralTableViewCell.self, forCellReuseIdentifier: GeneralTableViewCell.parentIdentifier)
        tableView.register(UserAccountDetailTableViewCell.self, forCellReuseIdentifier: UserAccountDetailTableViewCell.identifier)
        
        tableView.backgroundColor = backgroundColor
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SettingsHomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = settingsHomeViewModel.getSettingsModelListFromType(type: settingsHomeViewModel.sections[indexPath.section])
        
        if settingsHomeViewModel.sections[indexPath.section] == .userAppleAccount {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: UserAccountDetailTableViewCell.identifier, for: indexPath) as? UserAccountDetailTableViewCell else {
                return UITableViewCell()
            }
            cell.setup()
            cell.backgroundColor = .clear
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GeneralTableViewCell.parentIdentifier, for: indexPath) as? GeneralTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .clear
        
        cell.setup(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        settingsHomeViewModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = settingsHomeViewModel.sections[indexPath.section]
        let data = settingsHomeViewModel.getSettingsModelListFromType(type: section)
        
        if section == .userAppleAccount {
            return 100
        }
        return CGFloat(data.count*50)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let section = settingsHomeViewModel.sections[section]
        let data = settingsHomeViewModel.getSettingsModelListFromType(type: section)
        if data.isEmpty && section != .userAppleAccount {
            return nil
        }
        let footer = UIView()
        footer.setHeightConstraint(to: 20)
        return footer
    }
}

