import UIKit

class ProfileViewController: UIViewController {

    private lazy var profilePageTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Perfil"
        view.textColor = UIColor(named: "LabelColor")
        view.textAlignment = .center
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var userImage: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.image = UIImage(named: "profileImage")
        view.layer.cornerRadius = 80
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var userName: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Júnior Alfredo Gomes"
        view.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var email: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "E-mail:"
        view.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var emailTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = UIColor(named: "ScreenBackgroundColor")
        view.textAlignment = .left
        view.font = UIFont(name: "Helvetica", size: 18)
        view.text = "contato@dominio.com"
        view.textColor = UIColor.black
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var senha: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Senha:"
        view.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var senhaTextField: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont(name: "Helvetica", size: 18)
        view.text = "************"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var deleteAccountButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Deletar", for: .normal)
        view.backgroundColor = UIColor.red
        view.setTitleColor(UIColor.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var deleteAccountMessage: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Ao deletar a sua conta você perderá todos os seus dados"
        view.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfiguration()
        constraintsConfiguration()
    }
    
    func viewConfiguration() {
        view.backgroundColor = UIColor(named: "ScreenBackgroundColor")
        view.addSubview(profilePageTitle)
        view.addSubview(userImage)
        view.addSubview(userName)
        view.addSubview(email)
        view.addSubview(emailTextField)
        view.addSubview(senha)
        view.addSubview(senhaTextField)
        view.addSubview(deleteAccountButton)
        view.addSubview(deleteAccountMessage)
    }
    
    func constraintsConfiguration() {
        NSLayoutConstraint.activate([
            profilePageTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profilePageTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profilePageTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            
            userImage.topAnchor.constraint(equalTo: profilePageTitle.bottomAnchor, constant: 50),
            userImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImage.heightAnchor.constraint(equalToConstant: 150),
            userImage.widthAnchor.constraint(equalToConstant: 150),
            
            userName.topAnchor.constraint(equalTo: userImage.bottomAnchor, constant: 17),
            userName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            email.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 40),
            email.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            email.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            emailTextField.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 0),
            emailTextField.leadingAnchor.constraint(equalTo: email.leadingAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 270),
            emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            senha.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40),
            senha.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            senha.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            
            senhaTextField.topAnchor.constraint(equalTo: senha.bottomAnchor, constant: 10),
            senhaTextField.leadingAnchor.constraint(equalTo: senha.leadingAnchor),
            senhaTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            deleteAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            deleteAccountButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            deleteAccountButton.widthAnchor.constraint(equalToConstant: 90),
            deleteAccountButton.heightAnchor.constraint(equalToConstant: 45),
            
            deleteAccountMessage.centerYAnchor.constraint(equalTo: deleteAccountButton.centerYAnchor),
            deleteAccountMessage.leadingAnchor.constraint(equalTo: deleteAccountButton.trailingAnchor, constant: 15),
            deleteAccountMessage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }

}
