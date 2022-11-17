import UIKit

extension UIView {
    func addSubiewWithoutAutoresizing(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
