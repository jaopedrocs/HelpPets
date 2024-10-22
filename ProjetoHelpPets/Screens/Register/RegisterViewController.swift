import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    let padding: CGFloat = 16
    var ref: DatabaseReference! = Database.database().reference()
    
    lazy var titleRegisterPageLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Cadastro"
        view.font = UIFont(name: "Helvetica", size: 40)
        view.textColor = UIColor(named: "LabelColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var subTitleRegisterPageLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Faça seu cadastro para continuar"
        view.font = UIFont(name: "Helvetica", size: 15)
        view.textColor = UIColor(named: "LabelColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameRegisterPageTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = UIColor(named: "ComponentsBackgroundColor")
        view.textAlignment = .left
        view.attributedPlaceholder = NSAttributedString(string: "Nome",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        view.textColor = .white
        view.layer.cornerRadius = 18
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: view.frame.height))
        view.leftView = paddingView
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var emailRegisterPageTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = UIColor(named: "ComponentsBackgroundColor")
        view.textAlignment = .left
        view.attributedPlaceholder = NSAttributedString(string: "E-mail",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        view.textColor = .white
        view.layer.cornerRadius = 18
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: view.frame.height))
        view.leftView = paddingView
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var passwordRegisterPageTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = UIColor(named: "ComponentsBackgroundColor")
        view.textAlignment = .left
        view.attributedPlaceholder = NSAttributedString(string: "Senha",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        view.layer.cornerRadius = 18
        view.textColor = .white
        view.isSecureTextEntry = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: view.frame.height))
        view.leftView = paddingView
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var confirmPasswordRegisterPageTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = UIColor(named: "ComponentsBackgroundColor")
        view.textAlignment = .left
        view.attributedPlaceholder = NSAttributedString(string: "Confirme Sua Senha",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        view.layer.cornerRadius = 18
        view.textColor = .white
        view.isSecureTextEntry = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: view.frame.height))
        view.leftView = paddingView
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var registerButtonRegisterPage: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Login", for: .normal)
        view.setTitleColor(UIColor(named: "LabelColor"), for: .normal)
        view.backgroundColor = UIColor(named: "ButtonBackgroundColor")
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        view.layer.cornerRadius = 18
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var hasLoginLabelRegisterPage: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Já possui uma conta?"
        view.font = UIFont(name: "Helvetic", size: 14)
        view.textColor = UIColor(named: "LabelColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var goToLoginPage: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Cadastrar", for: .normal)
        view.setTitleColor(UIColor.orange, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfigurationsOfView()
        subViewsConstraintsConfiguration()
        registerButtonRegisterPage.addTarget(self, action: #selector(registerValidation), for: .touchUpInside)
        emailRegisterPageTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        goToLoginPage.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
    }
    
    private func setConfigurationsOfView() {
        view.addSubview(titleRegisterPageLabel)
        view.addSubview(subTitleRegisterPageLabel)
        view.addSubview(nameRegisterPageTextField)
        view.addSubview(emailRegisterPageTextField)
        view.addSubview(passwordRegisterPageTextField)
        view.addSubview(confirmPasswordRegisterPageTextField)
        view.addSubview(registerButtonRegisterPage)
        view.addSubview(hasLoginLabelRegisterPage)
        view.addSubview(goToLoginPage)
        
        view.backgroundColor = UIColor(named: "ScreenBackgroundColor")
    }
    
    private func subViewsConstraintsConfiguration() {
        NSLayoutConstraint.activate([
            titleRegisterPageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            titleRegisterPageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            subTitleRegisterPageLabel.topAnchor.constraint(equalTo: titleRegisterPageLabel.bottomAnchor, constant: 5),
            subTitleRegisterPageLabel.leadingAnchor.constraint(equalTo: titleRegisterPageLabel.leadingAnchor),
            
            nameRegisterPageTextField.topAnchor.constraint(equalTo: subTitleRegisterPageLabel.bottomAnchor, constant: 60),
            nameRegisterPageTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameRegisterPageTextField.heightAnchor.constraint(equalToConstant: 45),
            nameRegisterPageTextField.widthAnchor.constraint(equalToConstant: 280),
            
            emailRegisterPageTextField.topAnchor.constraint(equalTo: nameRegisterPageTextField.bottomAnchor, constant: 30),
            emailRegisterPageTextField.centerXAnchor.constraint(equalTo: nameRegisterPageTextField.centerXAnchor),
            emailRegisterPageTextField.heightAnchor.constraint(equalToConstant: 45),
            emailRegisterPageTextField.widthAnchor.constraint(equalToConstant: 280),
            
            passwordRegisterPageTextField.topAnchor.constraint(equalTo: emailRegisterPageTextField.bottomAnchor, constant: 30),
            passwordRegisterPageTextField.centerXAnchor.constraint(equalTo: emailRegisterPageTextField.centerXAnchor),
            passwordRegisterPageTextField.heightAnchor.constraint(equalToConstant: 45),
            passwordRegisterPageTextField.widthAnchor.constraint(equalToConstant: 280),
            
            confirmPasswordRegisterPageTextField.topAnchor.constraint(equalTo: passwordRegisterPageTextField.bottomAnchor, constant: 30),
            confirmPasswordRegisterPageTextField.centerXAnchor.constraint(equalTo: passwordRegisterPageTextField.centerXAnchor),
            confirmPasswordRegisterPageTextField.heightAnchor.constraint(equalToConstant: 45),
            confirmPasswordRegisterPageTextField.widthAnchor.constraint(equalToConstant: 280),
            
            registerButtonRegisterPage.topAnchor.constraint(equalTo: confirmPasswordRegisterPageTextField.bottomAnchor, constant: 80),
            registerButtonRegisterPage.centerXAnchor.constraint(equalTo: confirmPasswordRegisterPageTextField.centerXAnchor),
            registerButtonRegisterPage.heightAnchor.constraint(equalToConstant: 45),
            registerButtonRegisterPage.widthAnchor.constraint(equalToConstant: 210),
            
            hasLoginLabelRegisterPage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55),
            hasLoginLabelRegisterPage.leadingAnchor.constraint(equalTo: emailRegisterPageTextField.leadingAnchor, constant: 30),
            
            goToLoginPage.centerYAnchor.constraint(equalTo: hasLoginLabelRegisterPage.centerYAnchor),
            goToLoginPage.leadingAnchor.constraint(equalTo: hasLoginLabelRegisterPage.trailingAnchor, constant: 5),
            goToLoginPage.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
