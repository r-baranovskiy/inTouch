import UIKit

class TextFieldForLoginRegistration: UITextField {
    
    convenience init(placeholder: String,
                     keyboardType: UIKeyboardType = .default,
                     returnKeyType: UIReturnKeyType = .continue,
                     isSecure: Bool = false,
                     autocapitalization: UITextAutocapitalizationType = .none) {
        self.init()
        self.autocapitalizationType = autocapitalization
        self.autocorrectionType = .no
        self.keyboardType = keyboardType
        self.borderStyle = .roundedRect
        self.placeholder = placeholder
        self.textColor = .label
        self.returnKeyType = returnKeyType
        self.isSecureTextEntry = isSecure
        self.layer.cornerRadius = 12
        self.layer.borderWidth = 1
        self.layer.backgroundColor = UIColor.lightGray.cgColor
    }
}
