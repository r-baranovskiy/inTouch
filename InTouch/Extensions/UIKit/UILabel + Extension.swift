import UIKit

extension UILabel {
    func initLabel(text: String, font: UIFont, color: UIColor, textAlignment: NSTextAlignment, adjustsFontSizeToFitWidth: Bool, minimumScaleFactor: CGFloat) -> UILabel{
        self.text = text
        self.font = font
        self.textColor = color
        self.textAlignment = textAlignment
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
        self.minimumScaleFactor = minimumScaleFactor
        return self
    }
}
