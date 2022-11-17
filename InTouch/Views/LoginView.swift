import UIKit

class LoginView: UIView {
    
    //MARK: - Constants
    
    //MARK: - Override
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor(named: KeysColor.loginBackColor.rawValue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
