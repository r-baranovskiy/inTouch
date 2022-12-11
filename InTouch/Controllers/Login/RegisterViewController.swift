import UIKit

final class RegisterViewController: UIViewController, UINavigationControllerDelegate {
    
    //MARK: - UI Constants
    
    private let registerView = RegisterView()
    private var registerButton = UIButton()
    private var firstNameTextField = UITextField()
    private var lastNameTextFeld = UITextField()
    private var emailTextField = UITextField()
    private var passwordTextField = UITextField()
    private var confirmPasswordTextField = UITextField()
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
        
        hideKeyboardWhenTappedAround()
        
        //Notification for keyboard
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - Registration
    
    @objc private func registerButtonPressed() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let confirmPassword = confirmPasswordTextField.text,
              let firstName = firstNameTextField.text,
              let lastName = lastNameTextFeld.text,
              !email.isEmpty,
              !password.isEmpty,
              !confirmPassword.isEmpty,
              !firstName.isEmpty,
              !lastName.isEmpty else {
            return showAlert(title: "Ошибка ввода",
                             message: "Проверьте всю введенную информацию.")
        }
        
        if confirmPassword != password {
            showAlert(title: "Пароли не совпадают", message: "")
            return
        }
        
        if password.count < 6 {
            showAlert(title: "Неверный пароль", message: "Пароль должен содержать не менее 6-и символов")
            return
        }
    }
    
    
    
    //MARK: - Behaviour
    
    @objc private func userPhotoImagePressed() {
        presentPhotoActionAlert()
    }
    
    private func setTargets() {
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
    
    private func setDelegates() {
        firstNameTextField.delegate = self
        lastNameTextFeld.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    //MARK: - Appearance
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    private func setAppearance() {
        userPhotoView = registerView.userPhotoView
        registerButton = registerView.registerButton
        firstNameTextField = registerView.firstNameTextField
        lastNameTextFeld = registerView.lastNameTextField
        emailTextField = registerView.emailTextField
        passwordTextField = registerView.passwordTextField
        confirmPasswordTextField = registerView.confirmPasswordTextField
    }
}

//MARK: - UITextFieldDelegate

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.navigationController?.isNavigationBarHidden = true
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstNameTextField:
            lastNameTextFeld.becomeFirstResponder()
        case lastNameTextFeld:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            confirmPasswordTextField.becomeFirstResponder()
        case confirmPasswordTextField:
            registerButtonPressed()
        default:
            break
        }
        return true
    }
}

//MARK: - UIImagePickerControllerDelegate

extension RegisterViewController: UIImagePickerControllerDelegate {
    
    private func presentPhotoActionAlert() {
        let changeAlert = UIAlertController(title: "Фото для профиля",
                                            message: "Хотите создать новое фото или выбрать из существующих?",
                                            preferredStyle: .actionSheet)
        
        changeAlert.addAction(UIAlertAction(title: "Сделать фото",
                                            style: .default,
                                            handler: { [weak self] _ in
            self?.presentCamera()
        }))
        
        changeAlert.addAction(UIAlertAction(title: "Выбрать из галереи",
                                            style: .default,
                                            handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        
        changeAlert.addAction(UIAlertAction(title: "Отменить",
                                            style: .cancel))
        
        present(changeAlert, animated: true)
    }
    
    private func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    private func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        userPhotoView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
