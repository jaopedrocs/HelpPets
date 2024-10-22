import UIKit

class LoginViewController: UIViewController {
    
    let padding: CGFloat = 16
    
    private lazy var titleLoginPageLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Login"
        view.font = UIFont(name: "Helvetica", size: 40)
        view.textColor = UIColor(named: "LabelColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var subTitleLoginPageLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Faça login para continuar"
        view.font = UIFont(name: "Helvetica", size: 15)
        view.textColor = UIColor(named: "LabelColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var emailLoginPageTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = UIColor(named: "ComponentsBackgroundColor")
        view.textAlignment = .left
        view.attributedPlaceholder = NSAttributedString(string: "E-mail",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        view.layer.cornerRadius = 18
        view.textColor = .white
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: view.frame.height))
        view.leftView = paddingView
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var passwordLoginPageTextField: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = UIColor(named: "ComponentsBackgroundColor")
        view.textAlignment = .left
        view.attributedPlaceholder = NSAttributedString(string: "Senha",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        view.layer.cornerRadius = 18
        view.textColor = .white
        view.isSecureTextEntry = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: view.frame.height))
        view.leftView = paddingView
        view.leftViewMode = .always
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var forgotPassLoginPageButon: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Esqueceu sua senha?", for: .normal)
        view.setTitleColor(UIColor(named: "LabelColor"), for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var loginButtonLoginPage: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Login", for: .normal)
        view.setTitleColor(UIColor(named: "LabelColor"), for: .normal)
        view.backgroundColor = UIColor(named: "ButtonBackgroundColor")
        view.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        view.layer.cornerRadius = 18
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var dontHaveLoginLabelLoginPage: UILabel = {
        let view = UILabel(frame: .zero)
        view.text = "Não possui uma conta?"
        view.font = UIFont(name: "Helvetic", size: 14)
        view.textColor = UIColor(named: "LabelColor")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var goToRegistrerPage: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("Registre-se", for: .normal)
        view.setTitleColor(UIColor.orange, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConfigurationsOfView()
        subViewsConstraintsConfiguration()
        loginButtonLoginPage.addTarget(self, action: #selector(loginVerification), for: .touchUpInside)
        emailLoginPageTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        goToRegistrerPage.addTarget(self, action: #selector(goToRegister), for: .touchUpInside)
    }
    
    private func setConfigurationsOfView() {
        view.addSubview(titleLoginPageLabel)
        view.addSubview(subTitleLoginPageLabel)
        view.addSubview(emailLoginPageTextField)
        view.addSubview(passwordLoginPageTextField)
        view.addSubview(forgotPassLoginPageButon)
        view.addSubview(loginButtonLoginPage)
        view.addSubview(dontHaveLoginLabelLoginPage)
        view.addSubview(goToRegistrerPage)
        
        view.backgroundColor = UIColor(named: "ScreenBackgroundColor")
    }
    
    private func subViewsConstraintsConfiguration() {
        NSLayoutConstraint.activate([
            titleLoginPageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            titleLoginPageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            subTitleLoginPageLabel.topAnchor.constraint(equalTo: titleLoginPageLabel.bottomAnchor, constant: 5),
            subTitleLoginPageLabel.leadingAnchor.constraint(equalTo: titleLoginPageLabel.leadingAnchor),
            
            emailLoginPageTextField.topAnchor.constraint(equalTo: subTitleLoginPageLabel.bottomAnchor, constant: 60),
            emailLoginPageTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLoginPageTextField.heightAnchor.constraint(equalToConstant: 45),
            emailLoginPageTextField.widthAnchor.constraint(equalToConstant: 280),
            
            passwordLoginPageTextField.topAnchor.constraint(equalTo: emailLoginPageTextField.bottomAnchor, constant: 30),
            passwordLoginPageTextField.centerXAnchor.constraint(equalTo: emailLoginPageTextField.centerXAnchor),
            passwordLoginPageTextField.heightAnchor.constraint(equalToConstant: 45),
            passwordLoginPageTextField.widthAnchor.constraint(equalToConstant: 280),
            
            forgotPassLoginPageButon.topAnchor.constraint(equalTo: passwordLoginPageTextField.bottomAnchor, constant: 0),
            forgotPassLoginPageButon.trailingAnchor.constraint(equalTo: passwordLoginPageTextField.trailingAnchor),
            forgotPassLoginPageButon.heightAnchor.constraint(equalToConstant: 45),
            
            loginButtonLoginPage.topAnchor.constraint(equalTo: passwordLoginPageTextField.bottomAnchor, constant: 80),
            loginButtonLoginPage.centerXAnchor.constraint(equalTo: passwordLoginPageTextField.centerXAnchor),
            loginButtonLoginPage.heightAnchor.constraint(equalToConstant: 45),
            loginButtonLoginPage.widthAnchor.constraint(equalToConstant: 210),
            
            dontHaveLoginLabelLoginPage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55),
            dontHaveLoginLabelLoginPage.leadingAnchor.constraint(equalTo: passwordLoginPageTextField.leadingAnchor),
            
            goToRegistrerPage.centerYAnchor.constraint(equalTo: dontHaveLoginLabelLoginPage.centerYAnchor),
            goToRegistrerPage.leadingAnchor.constraint(equalTo: dontHaveLoginLabelLoginPage.trailingAnchor, constant: 5),
            goToRegistrerPage.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}
