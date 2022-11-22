import UIKit

class RegisterView: LoginView {
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        self.loginButton.setTitle("Регистрация", for: .normal)
        self.willRemoveSubview(forgetButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
