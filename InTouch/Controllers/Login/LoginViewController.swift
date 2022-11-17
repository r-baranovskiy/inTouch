
import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Constants
    
    private let loginView = LoginView()
    
    //MARK: - Lifecycles

    override func loadView() {
        super.loadView()
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc private func registerButtonWasPressed() {
        let controller = RegisterViewController()
        present(controller, animated: true)
    }

    
}

