import UIKit

class RegisterView: UIView {
    
    //MARK: - Constants
    
    private var backgroundImageView: UIImageView {
        return UIImageView(image: UIImage(named: KeysImages.backgroundImage.rawValue))
    }
    private let backgroundButtonColor = UIColor(named: KeysColor.buttonsBackColor.rawValue) ?? .gray
    
    private var fieldsStackView = UIStackView()
    
    private (set) var backButton = UIButton()
    private (set) var emailTextField = UITextField()
    private (set) var passwordTextField = UITextField()
    private (set) var firstNameTextField = UITextField()
    private (set) var lastNameTextField = UITextField()
    private (set) var registerButton = UIButton()
    private (set) var userPhotoView = UIImageView()
    
    //MARK: - Override
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        createBackButton()
        createRegisterButton()
        createUserPhotoView()
        configureTextFields()
        configureStackView()
        
        addSubview(backgroundImageView)
        addSubiewWithoutAutoresizing(backButton)
        addSubiewWithoutAutoresizing(fieldsStackView)
        addSubiewWithoutAutoresizing(registerButton)
        addSubiewWithoutAutoresizing(userPhotoView)
        
        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userPhotoView.layer.cornerRadius = userPhotoView.frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure
    
    private func configureTextFields() {
        firstNameTextField = UITextField()
            .initTextField(font: .boldSystemFont(ofSize: 20),
                           autocapitalization: .words,
                           autocorrection: .no,
                           keyboard: .default,
                           border: .roundedRect,
                           placeholder: "Имя",
                           textColor: .label)
        firstNameTextField.returnKeyType = .continue
        firstNameTextField.layer.cornerRadius = 12
        firstNameTextField.layer.borderWidth = 1
        firstNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        lastNameTextField = UITextField()
            .initTextField(font: .boldSystemFont(ofSize: 20),
                           autocapitalization: .words,
                           autocorrection: .no,
                           keyboard: .default,
                           border: .roundedRect,
                           placeholder: "Фамилия",
                           textColor: .label)
        lastNameTextField.returnKeyType = .continue
        lastNameTextField.returnKeyType = .continue
        lastNameTextField.layer.cornerRadius = 12
        lastNameTextField.layer.borderWidth = 1
        lastNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        emailTextField = UITextField()
            .initTextField(font: .boldSystemFont(ofSize: 20),
                           autocapitalization: .none,
                           autocorrection: .no,
                           keyboard: .emailAddress,
                           border: .roundedRect,
                           placeholder: "Email",
                           textColor: .label)
        emailTextField.returnKeyType = .continue
        emailTextField.layer.cornerRadius = 12
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        passwordTextField = UITextField()
            .initTextField(font: .boldSystemFont(ofSize: 20),
                           autocapitalization: .none,
                           autocorrection: .no,
                           keyboard: .default,
                           border: .roundedRect,
                           placeholder: "Password",
                           textColor: .label)
        passwordTextField.returnKeyType = .done
        passwordTextField.layer.cornerRadius = 12
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.isSecureTextEntry = true
    }
    
    private func configureStackView() {
        fieldsStackView.axis = .vertical
        fieldsStackView.spacing = 20
        
        let textFieldsArray: [UITextField] = [firstNameTextField,
                                              lastNameTextField,
                                              emailTextField,
                                              passwordTextField]
        
        textFieldsArray.forEach { fieldsStackView.addArrangedSubview($0) }
        textFieldsArray.forEach { $0.heightAnchor.constraint(equalToConstant: 52).isActive = true }
    }
    
    private func createUserPhotoView() {
        userPhotoView = UIImageView(image: UIImage(named: KeysImages.emptyPhoto.rawValue))
        userPhotoView.clipsToBounds = true
        userPhotoView.contentMode = .scaleAspectFill
    }
    
    private func createRegisterButton() {
        registerButton = UIButton(type: .system)
            .initButton(title: "Регистрация",
                        titleFor: .normal,
                        titleFont: .boldSystemFont(ofSize: 25),
                        backColor: .lightGray, titleColor: .label,
                        titleColorFor: .normal,
                        radius: 15)
    }
    
    private func createBackButton() {
        backButton = UIButton(type: .system)
            .initButton(title: "Назад",
                        titleFor: .normal,
                        titleFont: .boldSystemFont(ofSize: 30),
                        backColor: backgroundButtonColor,
                        titleColor: .label,
                        titleColorFor: .normal,
                        radius: 12)
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            backButton.widthAnchor.constraint(equalToConstant: 100),
            
            userPhotoView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 50),
            userPhotoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userPhotoView.heightAnchor.constraint(equalToConstant: 80),
            userPhotoView.widthAnchor.constraint(equalTo: userPhotoView.heightAnchor),
            
            fieldsStackView.topAnchor.constraint(equalTo: userPhotoView.bottomAnchor, constant: 50),
            fieldsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            fieldsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            registerButton.topAnchor.constraint(equalTo: fieldsStackView.bottomAnchor, constant: 50),
            registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            registerButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
