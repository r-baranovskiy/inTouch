import UIKit

extension UILabel {
    
    convenience init(text: String,
                     font: UIFont?,
                     textColor: UIColor,
                     adjustsFontSizeToFitWidth: Bool,
                     minimumScale: CGFloat = 0.3,
                     alignment: NSTextAlignment = .left) {
        self.init()
        self.text = text
        self.textColor = textColor
        self.font = font
        self.textAlignment = alignment
        
        if adjustsFontSizeToFitWidth {
            self.minimumScaleFactor = minimumScale
        }
    }
    
}
