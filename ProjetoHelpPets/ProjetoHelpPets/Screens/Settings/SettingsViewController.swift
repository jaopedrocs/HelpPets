//
//  SettingsViewController.swift
//  ProjetoFodaseDeSouza
//
//  Created by COTEMIG on 09/09/24.
//

import UIKit

class SettingsViewController: UIViewController {
    
    let cellIdentifier = SettingsTableViewCell.identifier
    
    private lazy var headerComponent: HeaderComponent = {
        let view = HeaderComponent(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var settingsTableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.register(SettingsTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        view.rowHeight = UITableView.automaticDimension
        view.separatorStyle = .none
        view.backgroundColor = .clear
        view.allowsSelection = true
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var categories: [Categories] = [
        .init(name: "Geral"),
        .init(name: "Suporte")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        viewConfiguration()
        subViewsConstraintsConfiguration()
    }
    
    private func viewConfiguration() {
        view.backgroundColor = UIColor(named: "ScreenBackgroundColor")
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(headerComponent)
        view.addSubview(settingsTableView)
        
        settingsTableView.dataSource = self
        settingsTableView.delegate = self
    }
    
    private func subViewsConstraintsConfiguration() {
        let screen = UIScreen.main.bounds
        
        NSLayoutConstraint.activate([
            headerComponent.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerComponent.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            headerComponent.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            headerComponent.heightAnchor.constraint(equalToConstant: screen.height / 8 ),
            
            settingsTableView.topAnchor.constraint(equalTo: headerComponent.bottomAnchor, constant: 40),
            settingsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            settingsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            settingsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }

}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? SettingsTableViewCell else {return .init()}
        cell.cellTitle.text = "TITULO"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let name = categories[section].name
        return name
    }
}
