import UIKit

extension UITextField {
    
    func initTextField(font: UIFont, autocapitalization: UITextAutocapitalizationType, autocorrection: UITextAutocorrectionType, keyboard: UIKeyboardType, border: BorderStyle, placeholder: String, textColor: UIColor) -> UITextField {
        self.font = font
        self.autocapitalizationType = autocapitalization
        self.autocorrectionType = autocorrection
        self.keyboardType = keyboard
        self.borderStyle = border
        self.placeholder = placeholder
        self.textColor = textColor
        return self
    }
}
