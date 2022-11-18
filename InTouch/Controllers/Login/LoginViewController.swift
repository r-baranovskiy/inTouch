import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Constants
    
    private let logivView = LoginView()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        view = logivView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
