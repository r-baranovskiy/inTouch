import UIKit

final class LoginView: UIView {
    
    //MARK: - UI Constants
    
    private var backgroundImageView: UIImageView {
        return UIImageView(image: UIImage(named: KeysImages.backgroundImage.rawValue))
    }
    
    private let backgroundButtonColor = UIColor(named: KeysColor.buttonsBackColor.rawValue) ?? .gray
    
    private var containerView = UIView()
    
    private let googleLabel = UILabel(text: "Войти через:",
                                      font: .avenir20(),
                                      textColor: .label,
                                      adjustsFontSizeToFitWidth: false)
    
    //TextFields
    let emailTextField = TextFieldForLoginRegistration(placeholder: "Email",
                                                       keyboardType: .emailAddress)
    let passwordTextField = TextFieldForLoginRegistration(placeholder: "Password",
                                                          isSecure: true)
    //Buttons
    let loginButton = CustomButton(text: "Войти", isShadow: false)
    let googleButton = CustomButton(text: "Google", isShadow: true)
    
    private (set) var forgetButton = UIButton(type: .system)
    
    //MARK: - Override
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubviews()
        uiSettings()
        CustomButton.customGoogleButton(googleButton)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        backgroundImageView.frame = self.frame
        addSubview(backgroundImageView)
        addSubiewWithoutAutoresizing(containerView)
        containerView.addSubiewWithoutAutoresizing(emailTextField)
        containerView.addSubiewWithoutAutoresizing(passwordTextField)
        containerView.addSubiewWithoutAutoresizing(forgetButton)
        containerView.addSubiewWithoutAutoresizing(loginButton)
        containerView.addSubiewWithoutAutoresizing(googleLabel)
        containerView.addSubiewWithoutAutoresizing(googleButton)
    }
    
    private func uiSettings() {
        forgetButton.setTitle("Забыли пароль?", for: .normal)
        forgetButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        forgetButton.setTitleColor(.red, for: .normal)
        
        googleButton.backgroundColor = .white
        googleButton.setTitleColor(.darkGray, for: .normal)
    }
    
    //MARK: - Constraints
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 100),
            containerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            emailTextField.topAnchor.constraint(equalTo: containerView.topAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 52),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            
            forgetButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            forgetButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            forgetButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            forgetButton.heightAnchor.constraint(equalToConstant: 20),
            
            loginButton.topAnchor.constraint(equalTo: forgetButton.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 54),
            
            googleLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 40),
            googleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            googleButton.topAnchor.constraint(equalTo: googleLabel.bottomAnchor, constant: 20),
            googleButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            googleButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40)
        ])
    }
}


