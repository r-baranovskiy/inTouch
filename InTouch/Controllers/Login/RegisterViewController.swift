import UIKit

final class RegisterViewController: UIViewController {
    
    //MARK: - UI Constants
    
    private let registerView = RegisterView()
    
    private var backButton = UIButton()
    private var registerButton = UIButton()
    private var firstNameTextField = UITextField()
    private var lastNameTextFeld = UITextField()
    private var emailTextField = UITextField()
    private var passwordTextField = UITextField()
    private var userPhotoView = UIImageView()

    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
        setTargets()
        setDelegates()
        setTapRecognizer()
    }
    
    //MARK: - Behaviour
    
    @objc private func userPhotoImagePressed() {
        
    }
    
    @objc private func backButtonPressed() {
        self.dismiss(animated: false)
    }
    
    @objc private func registerButtonPressed() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        firstNameTextField.resignFirstResponder()
        lastNameTextFeld.resignFirstResponder()
        
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let firstName = firstNameTextField.text,
              let lastName = lastNameTextFeld.text,
              !email.isEmpty,
              !password.isEmpty,
              !firstName.isEmpty,
              !lastName.isEmpty,
              password.count >= 6 else {
            return showAlert(title: "Ошибка ввода",
                           message: "Проверьте всю введенную информацию.")
        }
    }
    
    private func setTargets() {
        backButton.addTarget(self,
                             action: #selector(backButtonPressed),
                             for: .touchUpInside)
        registerButton.addTarget(self,
                                 action: #selector(registerButtonPressed),
                                 for: .touchUpInside)
    }
    
    private func setTapRecognizer() {
        let photoTapRecognizer = UITapGestureRecognizer(target: self,
                                                        action: #selector(userPhotoImagePressed))
        userPhotoView.isUserInteractionEnabled = true
        userPhotoView.addGestureRecognizer(photoTapRecognizer)
    }
    
    //MARK: - Appearance
    
    private func setDelegates() {
        firstNameTextField.delegate = self
        lastNameTextFeld.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setAppearance() {
        backButton = registerView.backButton
        userPhotoView = registerView.userPhotoView
        registerButton = registerView.registerButton
        firstNameTextField = registerView.firstNameTextField
        lastNameTextFeld = registerView.lastNameTextField
        emailTextField = registerView.emailTextField
        passwordTextField = registerView.passwordTextField
    }
}

//MARK: - UITextFieldDelegate

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstNameTextField:
            lastNameTextFeld.becomeFirstResponder()
        case lastNameTextFeld:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            registerButtonPressed()
        default:
            break
        }
        return true
    }
}
