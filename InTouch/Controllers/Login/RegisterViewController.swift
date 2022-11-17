import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: - Constants
    
    private let registerView = RegisterView()
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
        view = registerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
