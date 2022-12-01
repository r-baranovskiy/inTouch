import UIKit
import FirebaseAuth

final class RegisterViewController: UIViewController, UINavigationControllerDelegate {
    
    //MARK: - UI Constants
    
    private let registerView = RegisterView()
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
    
    //MARK: - Registration
    
    @objc private func registerButtonPressed() {
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
        createUser(email: email, password: password, firstName: firstName, lastName: lastName)
    }
    
    private func createUser(email: String, password: String, firstName: String, lastName: String) {
        DatabaseManager.shared.userExists(with: email) { [weak self] isExist in
            guard let strongSelf = self else {
                return
            }
            
            if !isExist {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    guard authResult != nil,
                          error == nil else {
                        strongSelf.showAlert(title: "Ошибка", message: error?.localizedDescription ?? "")
                        return
                    }
                }
            } else {
                strongSelf.showAlert(title: "Пользователь с таким email уже существует", message: "")
            }
            DatabaseManager.shared.addUser(with: ChatUser(firstName: firstName, lastName: lastName, emailAddress: email))
            strongSelf.navigationController?.pushViewController(ConversationsViewController(), animated: true)
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
    
    //MARK: - Appearance
    
    private func hideKeyboard() {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        firstNameTextField.resignFirstResponder()
        lastNameTextFeld.resignFirstResponder()
    }
    
    private func setDelegates() {
        firstNameTextField.delegate = self
        lastNameTextFeld.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func setAppearance() {
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

