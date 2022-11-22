import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: - Constants
    
    private let registerView = RegisterView()
    private var backButton = UIButton()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        view = registerView
        backButton = registerView.backButton
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc private func backButtonPressed() {
        self.dismiss(animated: false)
    }
}
