import UIKit

extension UIButton {
    
    func initButton(title: String, titleFor: UIControl.State, titleFont: UIFont, backColor: UIColor, titleColor: UIColor, titleColorFor: UIControl.State, radius: CGFloat) -> UIButton {
        self.setTitle(title, for: titleFor)
        self.titleLabel?.font = titleFont
        self.backgroundColor = backColor
        self.setTitleColor(titleColor, for: titleColorFor)
        self.layer.cornerRadius = radius
        return self
    }
}
