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
    
//    private func checkOnLoginUser() {
//        if Auth.auth().currentUser != nil {
//            navigationController?.pushViewController(ConversationsViewController(), animated: false)
//        }
//    }
    
    @objc private func registerButtonWasPressed() {
        navigationController?.pushViewController(RegisterViewController(), animated: false)
    }
    
    @objc private func loginButtonWasPressed() {
        navigationController?.pushViewController(LoginViewController(), animated: false)
    }
    
    private func setTargets() {
        loginButton.addTarget(self,
                              action: #selector(loginButtonWasPressed),
                              for: .touchUpInside)
        registerButton.addTarget(self,
                                 action: #selector(registerButtonWasPressed),
                                 for: .touchUpInside)
    }
    
    //MARK: - Appearance
    
    private func setAppearance() {
        navigationController?.navigationBar.topItem?.backButtonTitle = "Назад"
        navigationController?.navigationBar.tintColor = .label
        loginButton = startView.loginButton
        registerButton = startView.registerButton
    }
}

