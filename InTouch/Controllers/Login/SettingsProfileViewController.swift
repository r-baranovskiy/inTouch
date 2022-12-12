import UIKit

class SettingsProfileViewController: UIViewController {
    
    //MARK: - UI Constants
    
    private let settingsProfileView = SettingsProfileView()
    private var backButton = UIButton()
    
    override func loadView() {
        super.loadView()
        view = settingsProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton = settingsProfileView.backButton
        addTargets()
    }
    
    //MARK: - Behavior
    
    private func addTargets() {
        backButton.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
    }
    
    @objc private func backButtonPressed() {
        dismiss(animated: true)
    }
}
