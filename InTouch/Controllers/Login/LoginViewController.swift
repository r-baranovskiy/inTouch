import UIKit
import FirebaseAuth

final class LoginViewController: UIViewController {
    
    //MARK: - UI Constants
    
    private let logivView = LoginView()
    
    private var backButton = UIButton()
    private var loginButton = UIButton()
    private var emailTextField = UITextField()
    private var passwordTextField = UITextField()
    
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
    }
    
    //MARK: - LogIn User
    
    private func loginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            guard let result = authResult,
                  error == nil else {
                self.showAlert(title: "Error", message: error?.localizedDescription ?? "")
                return
            }
            print(result.user)
        }
    }
    
    //MARK: - Behaviour
    
    @objc private func backButtonPressed() {
        self.dismiss(animated: false)
    }
    
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
        loginUser(email: email, password: password)
    }
    
    private func setTargets() {
        backButton.addTarget(self, action: #selector(backButtonPressed),
                             for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonPressed),
                              for: .touchUpInside)
    }
    
    private func setDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    //MARK: - Appearance
    
    private func setAppearance() {
        backButton = logivView.backButton
        loginButton = logivView.loginButton
        emailTextField = logivView.emailTextField
        passwordTextField = logivView.passwordTextField
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
