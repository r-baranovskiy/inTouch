import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Constants
    
    private let logivView = LoginView()
    
    private var backButton = UIButton()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        view = logivView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton = logivView.backButton
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }
    
    //MARK: - Functions
    
    @objc private func backButtonPressed() {
        self.dismiss(animated: false)
    }
    
}
