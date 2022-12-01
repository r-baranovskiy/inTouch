import UIKit
import FirebaseAuth

class ConversationsViewController: UIViewController {
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
    }
    
    //MARK: - Behaviour
    
    @objc private func logOut() {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print(signOutError.localizedDescription)
        }
    }
    
    //MARK: - Appearance
    
    private func setAppearance() {
        view.backgroundColor = .white

        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .done, target: self, action: #selector(logOut))
    }
}
