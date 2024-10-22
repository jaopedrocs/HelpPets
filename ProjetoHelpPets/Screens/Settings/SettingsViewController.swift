import UIKit

class SettingsViewController: UIViewController {
    
    let cellIdentifier = SettingsTableViewCell.identifier
    
    private lazy var headerComponent: HeaderComponent = {
        let view = HeaderComponent(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var settingsTableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(SettingsTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        view.rowHeight = UITableView.automaticDimension
        view.separatorStyle = .none
        view.dataSource = self
        view.delegate = self
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
    
    private lazy var firstSection: [SettingsOptions] = [
        .init(name: "Gerenciar Conta"),
        .init(name: "Gerenciar Pets")
    ]
    
    private lazy var secondSection: [SettingsOptions] = [
        .init(name: "Termos de Serviço"),
        .init(name: "Fale Conosco")
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
    }
    
    private func subViewsConstraintsConfiguration() {
        NSLayoutConstraint.activate([
            headerComponent.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            headerComponent.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            headerComponent.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            settingsTableView.topAnchor.constraint(equalTo: headerComponent.bottomAnchor, constant: 25),
            settingsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            settingsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            settingsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40)
        ])
    }

}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? firstSection.count : secondSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SettingsTableViewCell
        let firstName = firstSection[indexPath.row].name
        let secondName = secondSection[indexPath.row].name
        
        if indexPath.section == 0 {
            cell?.SettingsCustomView.configureComponentData(text: firstName)
        } else {
            cell?.SettingsCustomView.configureComponentData(text: secondName)
        }
        
        return cell ?? UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let name = categories[section].name
        return name
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOption: String
        
        if indexPath.section == 0 {
            selectedOption = firstSection[indexPath.row].name
        } else {
            selectedOption = secondSection[indexPath.row].name
        }
        
        switch selectedOption {
        case "Gerenciar Conta":
            let vc = ProfileViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        case "Gerenciar Pets":
            let vc = PetRegisterViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        case "Termos de Serviço":
            alert(title: "Termos de Serviço", message: "Teste")
        case "Fale Conosco":
            alert(title: "Contato", message: "Teste")
        default:
            alert(title: "Erro", message: "Opção Inválida")
        }
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Voltar", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
