import UIKit

class RegisterView: UIView {
    
    //MARK: - UI
    private var backgroundImageView: UIImageView {
        return UIImageView(image: UIImage(named: KeysImages.backgroundImage.rawValue))
    }
    private (set) var userPhotoView = UIImageView()
    
    //Containers
    private var fieldsStackView = UIStackView()
    
    //TextFields
    let firstNameTextField = TextFieldForLoginRegistration(placeholder: "Имя",
                                                             autocapitalization: .words)
    let lastNameTextField = TextFieldForLoginRegistration(placeholder: "Фамилия",
                                                            autocapitalization: .words)
    let emailTextField = TextFieldForLoginRegistration(placeholder: "Email",
                                                         keyboardType: .emailAddress)
    let passwordTextField = TextFieldForLoginRegistration(placeholder: "Пароль",
                                                            isSecure: true)
    let confirmPasswordTextField = TextFieldForLoginRegistration(placeholder: "Подтвердите пароль",
                                                                   returnKeyType: .join,
                                                                   isSecure: true)
    
    //Buttons
    let registerButton = CustomButton(text: "Регистрация",
                                                               isShadow: false)
    //MARK: - Override
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundImageView.frame = self.frame
        createUserPhotoView()
        configureStackView()
        
        addSubview(backgroundImageView)
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
    
    private func configureStackView() {
        fieldsStackView.axis = .vertical
        fieldsStackView.spacing = 20
        fieldsStackView.distribution = .fillEqually
        
        let textFieldsArray: [UITextField] = [firstNameTextField,
                                              lastNameTextField,
                                              emailTextField,
                                              passwordTextField,
                                              confirmPasswordTextField]
        
        textFieldsArray.forEach { fieldsStackView.addArrangedSubview($0) }
        textFieldsArray.forEach { $0.heightAnchor.constraint(equalToConstant: 52).isActive = true }
    }
    
    private func createUserPhotoView() {
        userPhotoView = UIImageView(image: UIImage(named: KeysImages.emptyPhoto.rawValue))
        userPhotoView.clipsToBounds = true
        userPhotoView.contentMode = .scaleAspectFill
        userPhotoView.layer.borderWidth = 2
        userPhotoView.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userPhotoView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            userPhotoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            userPhotoView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.18),
            userPhotoView.widthAnchor.constraint(equalTo: userPhotoView.heightAnchor),
            
            fieldsStackView.topAnchor.constraint(equalTo: userPhotoView.bottomAnchor, constant: 50),
            fieldsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            fieldsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            registerButton.topAnchor.constraint(greaterThanOrEqualTo: fieldsStackView.bottomAnchor, constant: 10),
            registerButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40),
            registerButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            registerButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
            registerButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}


