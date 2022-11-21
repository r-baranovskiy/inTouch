import UIKit

class LoginView: UIView {
    
    //MARK: - Constants
    
    private var backgroundImageView: UIImageView {
        return UIImageView(image: UIImage(named: KeysImages.backgroundImage.rawValue))
    }
    let backgroundButtonColor = UIColor(named: KeysColor.buttonsBackColor.rawValue) ?? .gray
    
    var backButton = UIButton()
    var loginTextField = UITextField()
    var passwordTextField = UITextField()
    var loginButton = UIButton()
    var forgetButton = UIButton()
    
    private var containerView = UIView()
    
    //MARK: - Override
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        configureView()
        configureContainerView()
        
        addSubview(backgroundImageView)
        addSubiewWithoutAutoresizing(backButton)
        addSubiewWithoutAutoresizing(containerView)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureContainerView() {
        loginTextField = UITextField()
            .initTextField(font: .boldSystemFont(ofSize: 20),
                           autocapitalization: .none,
                           autocorrection: .no,
                           keyboard: .emailAddress,
                           border: .roundedRect,
                           placeholder: "Email",
                           textColor: .label)
        
        passwordTextField = UITextField()
            .initTextField(font: .boldSystemFont(ofSize: 20),
                           autocapitalization: .none,
                           autocorrection: .no,
                           keyboard: .default,
                           border: .roundedRect,
                           placeholder: "Password",
                           textColor: .label)
        passwordTextField.isSecureTextEntry = true
        
        forgetButton = UIButton(type: .system).initButton(title: "Забыли пароль?", titleFor: .normal, titleFont: .boldSystemFont(ofSize: 18), backColor: .clear, titleColor: .label, titleColorFor: .normal, radius: 0)
        
        loginButton = UIButton(type: .system).initButton(title: "Войти", titleFor: .normal, titleFont: .boldSystemFont(ofSize: 25), backColor: .lightGray, titleColor: .label, titleColorFor: .normal, radius: 15)

        containerView.addSubiewWithoutAutoresizing(loginTextField)
        containerView.addSubiewWithoutAutoresizing(passwordTextField)
        containerView.addSubiewWithoutAutoresizing(forgetButton)
        containerView.addSubiewWithoutAutoresizing(loginButton)
    }
    
    private func configureView() {
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
            
            containerView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 100),
            containerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            
            loginTextField.topAnchor.constraint(equalTo: containerView.topAnchor),
            loginTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            loginTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            forgetButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            forgetButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            forgetButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            forgetButton.heightAnchor.constraint(equalToConstant: 20),
            
            loginButton.topAnchor.constraint(equalTo: forgetButton.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
}
