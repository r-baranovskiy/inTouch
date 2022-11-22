import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Constants
    
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
        backButton = logivView.backButton
        loginButton = logivView.loginButton
        emailTextField = logivView.emailTextField
        passwordTextField = logivView.passwordTextField
        backButton.addTarget(self, action: #selector(backButtonPressed),
                             for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonPressed),
                              for: .touchUpInside)
        
    }
    
    //MARK: - Functions
    
    @objc private func backButtonPressed() {
        self.dismiss(animated: false)
    }
    
    @objc private func loginButtonPressed() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              !email.isEmpty,
              !password.isEmpty, password.count >= 6 else {
            self.showAlert(title: "Ошибка ввода",
                           message: "Проверьте всю введенную информацию."); return
        }
    }
}
