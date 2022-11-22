import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .cancel)
        controller.addAction(action)
        present(controller, animated: true)
    }
}
