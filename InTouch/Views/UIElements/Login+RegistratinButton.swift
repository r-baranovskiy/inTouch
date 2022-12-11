import UIKit

class LoginRegistrationButton: UIButton {
    
    convenience init(text: String, isShadow: Bool) {
        self.init()
        self.init(type: .system)
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = UIFont(name: "avenir", size: 30)
        self.backgroundColor = .gray
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 10
        
        if isShadow {
            self.layer.shadowColor = UIColor.darkGray.cgColor
            self.layer.shadowRadius = 5
            self.layer.shadowOpacity = 10
            self.layer.shadowOffset = CGSize(width: 0, height: 10)
        }
    }
}
