import UIKit

class StartViewController: UIViewController {
    
    //MARK: - UI constants
    
    private let startView = StartView()
    private var loginButton = UIButton()
    private var registerButton = UIButton()
    
    //MARK: - Lifecycles

    override func loadView() {
        super.loadView()
        view = startView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
        setTargets()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    //MARK: - Behaviour
    
    private func setTargets() {
        loginButton.addTarget(self,
                              action: #selector(loginButtonPressed),
                              for: .touchUpInside)
        registerButton.addTarget(self,
                                 action: #selector(registerButtonPressed),
                                 for: .touchUpInside)
    }
    
    @objc private func registerButtonPressed() {
        navigationController?.pushViewController(RegisterViewController(), animated: false)
    }
    
    @objc private func loginButtonPressed() {
        navigationController?.pushViewController(LoginViewController(), animated: false)
    }
    
    //MARK: - Appearance
    
    private func setAppearance() {
        navigationController?.navigationBar.topItem?.backButtonTitle = "Назад"
        navigationController?.navigationBar.tintColor = .label
        loginButton = startView.loginButton
        registerButton = startView.registerButton
    }
}

