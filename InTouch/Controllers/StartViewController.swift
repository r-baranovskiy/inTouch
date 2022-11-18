
import UIKit

class StartViewController: UIViewController {
    
    //MARK: - Constants
    
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
        loginButton = startView.logInButton
        registerButton = startView.registerButton
        
        loginButton.addTarget(self, action: #selector(loginButtonWasPressed), for: .touchUpInside)
        registerButton.addTarget(self, action: #selector(registerButtonWasPressed), for: .touchUpInside)
    }
    
    //MARK: - Functions
    
    @objc private func registerButtonWasPressed() {
        let controller = RegisterViewController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: false)
    }
    
    @objc private func loginButtonWasPressed() {
        let controller = LoginViewController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: false)
    }

    
}

