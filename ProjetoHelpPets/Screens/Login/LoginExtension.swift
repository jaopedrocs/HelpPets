import UIKit
import FirebaseAuth

extension LoginViewController {
    @objc func loginVerification() {
        if (emailLoginPageTextField.text == "" || passwordLoginPageTextField.text == "") {
            alert(title: "Campos", message: "Preencha todos os campos")
        } else {
            Auth.auth().signIn(withEmail: emailLoginPageTextField.text!, password: passwordLoginPageTextField.text!) {authResult, Error in
                if (Error != nil) {
                    self.alert(title: "Erro", message: "E-mail ou senha incorretos")
                } else {
                    self.goToHome()
                }
            }
        }
    }
    
    func alert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    @objc func goToRegister() {
        let vc = RegisterViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc func goToHome() {
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            emailLoginPageTextField.text = text.lowercased()
        }
    }
}
