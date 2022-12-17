import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - UIConstants
    
    private let profileView = ProfileView()
    
    override func loadView() {
        super.loadView()
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
