import UIKit

class ConversationsViewController: UIViewController {
    
    //MARK: - Lifecycles
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    //MARK: - Appearance
    
    private func setAppearance() {
        view.backgroundColor = .white
    }
}
