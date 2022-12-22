import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: - UI Constants
    
    private let logivView = LoginView()
    
    private var loginButton = UIButton()
    private var emailTextField = UITextField()
    private var passwordTextField = UITextField()
    private var backButton = UIButton()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        view = logivView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
        setTargets()
        setDelegates()
        
        hideKeyboardWhenTappedAround()
    }
    
    //MARK: - Behaviour
    
    private func setTargets() {
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonPressed),
                              for: .touchUpInside)
    }
    
    private func setDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    //MARK: - Objc buttons funcs
    
    @objc private func loginButtonPressed() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              !email.isEmpty,
              !password.isEmpty, password.count >= 6
        else {
            return
        }
        
        AuthService.shared.login(email: email,
                                 password: password) { (result) in
            switch result {
                
            case .success(_):
                print("success")
            case .failure(_):
                print("fail")
            }
        }
    }
    
    @objc private func backButtonPressed() {
        self.dismiss(animated: true)
    }
    
    //MARK: - Appearance
    
    private func setAppearance() {
        loginButton = logivView.loginButton
        emailTextField = logivView.emailTextField
        passwordTextField = logivView.passwordTextField
        backButton = logivView.backButton
    }
}

//MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            loginButtonPressed()
        }
        return true
    }
}
